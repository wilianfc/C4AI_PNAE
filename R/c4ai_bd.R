#Connect to postgis for geospatial queries
#install.packages("RPostgreSQL")

##install.packages("rpg", repos="http://R-Forge.R-project.org")
require(DBI)
require(RPostgreSQL)


#enviromment defaults
#p4s_geo<-"+proj=longlat +datum=WGS84"
#crs.geo<-CRS(p4s_geo)
pg_user<-"postgres"
pg_passwd<-"123"
pg_port<-5432
pg_host<-"localhost"
pg_dbname<-"c4ai"
dsn<-paste("PG:dbname =", pg_dbname, "user =", pg_user, "password =",pg_passwd, "port =", pg_port, "host=", pg_host)

drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv,user=pg_user, password=pg_passwd, dbname=pg_dbname, port=pg_port, host=pg_host)