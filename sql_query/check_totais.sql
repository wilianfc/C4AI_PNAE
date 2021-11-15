--check docitems_f0236512
SELECT *, (docitens.docitens_total=docinfo."Valor Total do Documento") as "Soma dos itens é igual total" FROM (
	SELECT 
		SUM(TO_NUMBER("Valor Total (R$)", 'FM999G999D99S'  )::money) as docitens_total,
   -- "Valor Total (R$)",
	--TO_NUMBER("Valor Total (R$)", 'FM999G999D99S'  )::money
	    nf_c4ai_id
		FROM public.docitems_f0236512
		Group BY (nf_c4ai_id)) AS docitens,	
	(
	SELECT  
 		TO_NUMBER("Valor Total do Documento", 'FM999G999D99S'  )::money as "Valor Total do Documento",
  		nf_c4ai_id
	FROM public.docinfo
	) as docinfo
	
	WHERE docinfo.nf_c4ai_id = docitens.nf_c4ai_id
	
	
	
	--check docitems_933d0521
	SELECT *, (docitens.docitens_total=docinfo."Valor Total do Documento") as "Soma dos itens é igual total" FROM (
	SELECT 
		SUM(TO_NUMBER("Valor Total (R$)", 'FM999G999D99S'  )::money) as docitens_total,
   -- "Valor Total (R$)",
	--TO_NUMBER("Valor Total (R$)", 'FM999G999D99S'  )::money
	    nf_c4ai_id
		FROM public.docitems_933d0521
		Group BY (nf_c4ai_id)) AS docitens,	
	(
	SELECT  
 		TO_NUMBER("Valor Total do Documento", 'FM999G999D99S'  )::money as "Valor Total do Documento",
  		nf_c4ai_id
	FROM public.docinfo
	) as docinfo
	
	WHERE docinfo.nf_c4ai_id = docitens.nf_c4ai_id
	
	
	
		
	--check docitems_f1ecd601
	SELECT *, (docitens.docitens_total=docinfo."Valor Total do Documento") as "Soma dos itens é igual total" FROM (
	SELECT 
		SUM(TO_NUMBER("Valor Total (R$)", 'FM999G999D99S'  )::money) as docitens_total,
   -- "Valor Total (R$)",
	--TO_NUMBER("Valor Total (R$)", 'FM999G999D99S'  )::money
	    nf_c4ai_id
		FROM public.docitems_f1ecd601
		Group BY (nf_c4ai_id)) AS docitens,	
	(
	SELECT  
 		TO_NUMBER("Valor Total do Documento", 'FM999G999D99S'  )::money as "Valor Total do Documento",
  		nf_c4ai_id
	FROM public.docinfo
	) as docinfo
	
	WHERE docinfo.nf_c4ai_id = docitens.nf_c4ai_id
	
	
	