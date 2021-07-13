


install.packages(c('rstudioapi','rjson', 'gtools', 'sqldf', 'iterators', 'digest'))

library(rstudioapi)

# Getting the path of your current open file
current_path = rstudioapi::getActiveDocumentContext()$path 
setwd(dirname(current_path ))
print( getwd() )


source("c4ai_bd.R")

require(sqldf)
require(rjson)
require(gtools)
require(iterators)
require(digest)

conc_text <- function(json_field){
  return( paste('"',json_field,'"', " text", sep=""))
}

log_con <- file("err.log")
sink(log_con, append=TRUE)
sink(log_con, append=TRUE, type="message")


#Current
path<-paste(getwd(),"..", "data","json", sep=.Platform$file.sep)
list.json.pnae <- mixedsort(list.files(path, full.names=T, pattern=".json"))

for(filepath in list.json.pnae) {
  message(filepath)
  

  
  # #json_file <- "http://api.worldbank.org/country?per_page=10&region=OED&lendingtype=LNX&format=json"
  # json_file <- "file:///E:/OneDrive - Instituto Presbiteriano Mackenzie/C4AI/expense-SP-3506102-2019-2554957.json"
  # json_data <- fromJSON(,json_file)
  # json_data <- fromJSON(paste(readLines(json_file), collapse=""))
  
  json_data <- fromJSON(, filepath)
  # json_data <- fromJSON(paste(readLines(json_file), collapse=""))
  
  ################## Extract Log  #############################
  
  sha256_data_id <- digest(json_data, algo = "sha256")
  
  extract_log_fields <- json_data$extractLog$fields
  create_extract_log_fields <-
    paste(conc_text(extract_log_fields), collapse = ", ") # cria string  de campos para create sql
  insert_extract_log_fields <-
    paste('"',
          extract_log_fields,
          '"',
          collapse = ", ",
          sep = "")
  
  insert_extract_log_data <-
    paste("'",
          unlist(json_data$extractLog$data),
          "'",
          collapse = ", ",
          sep = "")
  
  
  ### creating table
  
  message(paste(
    "extractLog: Campos identificados:\n",
    insert_extract_log_fields
  ))
  
  #cria a tabela docinfo no postgresSQL
  sql.query <-
    paste(
      "CREATE TABLE IF NOT EXISTS extractLog (",
      create_extract_log_fields,
      ', "sha256_id" text PRIMARY KEY',
      ");"
    )
  rs <- postgresqlpqExec(con, sql.query)
  
  
  ## inserting data
  
  message(paste("extractLog: inserindo dados:\n",   insert_extract_log_data))
  sql.query <-
    paste(
      'INSERT INTO extractLog (',
      insert_extract_log_fields ,
      ', "sha256_id"',
      ') VALUES (',
      insert_extract_log_data ,
      ',\'',
      sha256_data_id,
      '\'',
      ');',
      sep = ""
    )
  rs <- postgresqlpqExec(con, sql.query)
  
  
  
  #############################################################
  
  ################## Data Identification ######################
  
  dataidentification_fields <- json_data$dataIdentification$fields
  dataidentification_data <-
    paste(
      "'",
      unlist(json_data$dataIdentification$data),
      "'",
      collapse = ", ",
      sep = ""
    )
  
  
  
  create_dataidentification_fields <-
    paste(conc_text(dataidentification_fields), collapse = ", ")
  insert_dataidentification_fields <-
    paste('"',
          dataidentification_fields,
          '"',
          collapse = ", ",
          sep = "")
  
  
  sql.query <-
    paste(
      "CREATE TABLE IF NOT EXISTS dataIdentification (",
      create_dataidentification_fields,
      ', "sha256_id" text REFERENCES extractLog(sha256_id)',
      ");"
    )
  rs <- postgresqlpqExec(con, sql.query)
  
  
  sql.query <-
    paste(
      'INSERT INTO dataIdentification (',
      insert_dataidentification_fields ,
      ', "sha256_id"',
      ') VALUES (',
      dataidentification_data ,
      ',\'',
      sha256_data_id,
      '\'',
      ');',
      sep = ""
    )
  rs <- postgresqlpqExec(con, sql.query)
  
  
  ##########################################################################
  
  ######### verificar se todos os documentData$data[[i]]$docInfo$fields
  ######## possuem o mesmo numero de campos
  ####  Assume que sÃ£o iguais se sim
  
  
  tam <- length(json_data$documentData$data) #Quantidade de notas
  #### verificar se todos tem o mesmo tamanho
  text_fields_new <- NULL
  text_fields_create <- ""  #variÃ¡vel utilizada para criar campos
  
  for (i in 1:tam) {
    # se sim, criar tabela no postgres usando como base o primeiro registro
    
    len <-
      length(json_data$documentData$data[[i]]$docInfo$data) #tamanho obtido pelo s dados devido a campos faltantes nos fields
    for (f in 1:len) {
      field <- json_data$documentData$data[[i]]$docInfo$fields[f]
      if (is.na(field))
        field <- paste("field_", f, sep = "")
      if (is.null(text_fields_new)) {
        text_fields_new <- paste('"', field, '" text', ",", sep = "")
        
      } else if (f < len) {
        text_fields_new <-
          paste(text_fields_new, '"', field, '" text', ",", sep = "")
        
      } else{
        text_fields_new <-
          paste(text_fields_new, '"', field, '" text', sep = "")
        
      }
      if (nchar(text_fields_new) > nchar(text_fields_create))
        text_fields_create <- text_fields_new
    }
    
    text_fields_new <- NULL
    
  }
  
  
  message(paste("docinfo: Campos identificados:\n", text_fields_create))
  
  
  #cria a tabela docinfo no postgresSQL
  sql.query <-
    paste(
      "CREATE TABLE IF NOT EXISTS docInfo (",
      text_fields_create,
      ',
      "sha256_id" text REFERENCES extractLog(sha256_id), nf_c4ai_id text PRIMARY KEY',
      ");"
    )
  rs <- postgresqlpqExec(con, sql.query)
  
  ###########################
  
  
  #Popular a tabela docinfo no postgreSQL - INSERTS
  
  # mÃ©todo alternativo
  # text_fields<-NULL
  # for (f in 1:len) {
  #   field <- json_data$documentData$data[[i]]$docInfo$fields[f]
  #   if(is.na(field)) field<-paste("field_", f, sep="")
  #   if (is.null(text_fields)) {
  #     text_fields <- paste('"', field, '"', ",", sep = "")
  #
  #   } else if (f < len) {
  #     text_fields <- paste(text_fields, '"', field, '"', ",", sep = "")
  #
  #   } else{
  #     text_fields <- paste(text_fields, '"', field, '"', sep = "")
  #
  #   }
  # }
  

  
  ########################
  
  
  
  for (i in 1:tam) {
    text_fields <-
      paste(
        '"',
        json_data$documentData$data[[i]]$docInfo$fields,
        '"',
        collapse = ", ",
        sep = ""
      ) #campos para insert
    #print(json_data$documentData$data[[i]]$docInfo)
    #print(length(json_data$documentData$data[[i]]$docInfo$fields))
    
    #get string field list
    text_data <- NULL
    len <- length(json_data$documentData$data[[i]]$docInfo$data)
    #if (len == 14) {
    for (d in 1:len) {
      data <- json_data$documentData$data[[i]]$docInfo$data[d]
      if (data == "")
        data = " "
      if (is.null(text_data)) {
        text_data <- paste("'", data, "'", ",", sep = "")
        
      } else if (d < len) {
        text_data <- paste(text_data, "'", data, "'", ",", sep = "")
        
      } else{
        text_data <- paste(text_data, "'", data, "'", sep = "")
      }
    }
    nf_c4ai_id <- digest(text_data, algo = "sha256")
    #INSERT INTO table_name (column1, column2, column3, ...)
    #VALUES (value1, value2, value3, ...);
    
    sql.query <-
      paste(
        'INSERT INTO docInfo (',
        text_fields,
        ', "sha256_id", "nf_c4ai_id"',
        ') VALUES (',
        text_data ,
        ',\'',
        sha256_data_id,
        '\'',
        ',\'',
        nf_c4ai_id,
        '\'',
        ');',
        sep = ""
      )
    

    
    
    out <- tryCatch(
      
      ########################################################
      # Try part: define the expression(s) you want to "try" #
      ########################################################
      
      {
        # Just to highlight: 
        # If you want to use more than one R expression in the "try part" 
        # then you'll have to use curly brackets. 
        # Otherwise, just write the single expression you want to try and 
        
        rs <- postgresqlpqExec(con, sql.query)
      },
      
      ########################################################################
      # Condition handler part: define how you want conditions to be handled #
      ########################################################################
      
      # Handler when a warning occurs:
      warning = function(cond) {
        message(cond)
        
        # Choose a return value when such a type of condition occurs
        return(NULL)
      },
      
      # Handler when an error occurs:
      error = function(cond) {
        
        message(paste("\n\n Error message: ", cond, "\n"))
        message(paste("NÃ£o foi possivel inserir a nota ", i, " do arquivo", filepath, "\n"))
        message(paste("Query:",sql.query, "\n" ))
        
        # Choose a return value when such a type of condition occurs
        return(1)
      },
      
      ###############################################
      # Final part: define what should happen AFTER #
      # everything has been tried and/or handled    #
      ###############################################
      
      finally = {
 
      }
    ) 

    if(out==1) next
  
    
    # } else{
    #   message(paste("verificar docinfo > 14 fields", i))
    #   print(json_data$documentData$data[[i]]$docInfo$data)
    #}
    
    
    #text<-paste(json_data$documentData$data[[i]]$docInfo$fields)
    
    #print(length(json_data$documentData$data[[i]]$docItems$fields))
    #print(json_data$documentData$data[[i]]$docItems)
    
    #text<-content(response, type = 'text', encoding = "UTF-8")
    
    #}
    
    
    #################################################################
    #################################################################
    ##########       Populate itens
    #################################################################
    
    # Obter campos
    
    
    #text_fields <- NULL
    
   # for (i in 1:tam) {
      #chave_nf <- json_data$documentData$data[[i]]$docInfo$data[4]
      
      len_fields <-
        length(json_data$documentData$data[[i]]$docItems$fields)
      len_itens <-
        length(json_data$documentData$data[[i]]$docItems$data)
      
      #get create table field list
      text_fields_create <- NULL
      for (f in 1:len_fields) {
        field <- json_data$documentData$data[[i]]$docItems$fields[f]
        if (is.na(field))
          field <- paste("field_", f, sep = "")
        if (is.null(text_fields_create)) {
          text_fields_create <- paste('"', field, '" text', ",", sep = "")
          
        } else if (f < len_fields) {
          text_fields_create <-
            paste(text_fields_create, '"', field, '" text', ",", sep = "")
          
        } else{
          text_fields_create <-
            paste(
              text_fields_create,
              '"',
              field,
              '" text',
              " , nf_c4ai_id text REFERENCES docinfo(nf_c4ai_id)",
              sep = ""
            )
          
        }
      }
      
      
      
      
      
      #get string field list insert
      text_fields_itens <- NULL
      for (f in 1:len_fields) {
        field <- json_data$documentData$data[[i]]$docItems$fields[f]
        if (is.na(field))
          field <- paste("field_", f, sep = "")
        if (is.null(text_fields_itens)) {
          text_fields_itens <- paste('"', field, '"', ",", sep = "")
          
        } else if (f < len_fields) {
          text_fields_itens <-
            paste(text_fields_itens, '"', field, '"', ",", sep = "")
          
        } else{
          text_fields_itens <-
            paste(text_fields_itens, '"', field, '"', " , nf_c4ai_id", sep = "")
          
        }
      }
      
      crc32 <- digest(text_fields_itens, algo = "crc32")
      
      
      #cnpj_cpf <- json_data$documentData$data[[i]]$docInfo$data[1]
      
      
      
      for (it in 1:len_itens) {
        text_data <- NULL
        for (f in 1:len_fields) {
          data <- json_data$documentData$data[[i]]$docItems$data[[it]][f]
          
          if (data == "")
            data = " "
          if (is.null(text_data)) {
            text_data <- paste("'", data, "'", ",", sep = "")
            
          } else if (f < len_fields) {
            text_data <- paste(text_data, "'", data, "'", ",", sep = "")
            
          } else{
            text_data <-
              paste(text_data,
                    "'",
                    data,
                    "'",
                    ",",
                    "'",
                    nf_c4ai_id,
                    "'",
                    sep = "")
          }
        }
        #insert
        #INSERT INTO table_name (column1, column2, column3, ...)
        #VALUES (value1, value2, value3, ...);
        
        #cria a tabela docItems no postgresSQL
        sql.query <-
          paste("CREATE TABLE IF NOT EXISTS docItems_",
                crc32,
                "(",
                text_fields_create,
                ");",
                sep = '')
        rs <- postgresqlpqExec(con, sql.query)
        
        sql.query <-
          paste(
            'INSERT INTO docitems_',
            crc32,
            '(',
            text_fields_itens,
            ') VALUES (',
            text_data ,
            ');',
            sep = ""
          )
        rs <- postgresqlpqExec(con, sql.query)
        
      }
      
      #text<-paste(json_data$documentData$data[[i]]$docInfo$fields)
      
      #print(length(json_data$documentData$data[[i]]$docItems$fields))
      #print(json_data$documentData$data[[i]]$docItems)
      
      #text<-content(response, type = 'text', encoding = "UTF-8")
      
    }
    
}

#obter tabelas criadas e salvar como CSV

sql.query<-"SELECT tablename FROM pg_catalog.pg_tables
WHERE schemaname != 'information_schema' AND
schemaname != 'pg_catalog' AND tablename !='spatial_ref_sys';" 

nomes_tabelas<-sqldf(sql.query, dbname=pg_dbname, user=pg_user, password=pg_passwd, host=pg_host, port=pg_port)


path<-paste(getwd(),"..", "data","csv",'', sep=.Platform$file.sep)

for(nome_tab in nomes_tabelas$tablename ){
  
  tabela<-postgresqlReadTable(con, nome_tab )
  write.csv2(tabela, file=paste(path, nome_tab,'_utf8.csv', sep="" ))
  
}




closeAllConnections()
# Restore output to console
sink() 
sink(type="message")














