--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.22
-- Dumped by pg_dump version 9.6.22

-- Started on 2021-11-15 18:43:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2991 (class 1262 OID 18909)
-- Name: pnae; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE pnae WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


ALTER DATABASE pnae OWNER TO postgres;

\connect pnae

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 18910)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 191 (class 1259 OID 23539)
-- Name: dataidentification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dataidentification (
    "Tipo de Concessão:" text,
    "CNPJ:" text,
    "Nome da Entidade:" text,
    "Programa:" text,
    "Nº da Transferência:" text,
    "Vigência:" text,
    "Situação:" text,
    "Prazo para PC:" text,
    "Município/UF:" text,
    "Unidade Executora:" text,
    "Objeto Executado" text,
    "Objetivo" text,
    sha256_id text NOT NULL
);


ALTER TABLE public.dataidentification OWNER TO postgres;

--
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN dataidentification.sha256_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dataidentification.sha256_id IS 'sha256 generated for json file text';


--
-- TOC entry 192 (class 1259 OID 23547)
-- Name: docinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docinfo (
    "tablePageN" text,
    "rowN" text,
    "CNPJ/CPF" text,
    "Fornecedor" text,
    "Tipo de Documento" text,
    "Chave de Acesso da Nota Fiscal" text,
    "Número do Documento" text,
    "Número de Série" text,
    "Data da Emissão do Documento" text,
    "Valor Total do Documento" text,
    "Desconto" text,
    "Data de Entrega" text,
    "Valor Apropriado/A Pagar" text,
    "Valor de Custeio" text,
    "Numero de Inscricao DAP" text,
    "Observacao" text,
    sha256_id text,
    nf_c4ai_id text NOT NULL
);


ALTER TABLE public.docinfo OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 23575)
-- Name: docitems_933d0521; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docitems_933d0521 (
    "Descrição" text,
    "Unid. de Medida" text,
    "Natureza da Despesa" text,
    "Qtde." text,
    "Valor Unitário (R$)" text,
    "Valor Total (R$)" text,
    "Operações" text,
    nf_c4ai_id text
);


ALTER TABLE public.docitems_933d0521 OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 23555)
-- Name: docitems_f0236512; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docitems_f0236512 (
    "Código do Produto" text,
    "Descrição do Produto / Serviço" text,
    "NCM/SH" text,
    "O/CST" text,
    "CFOP" text,
    "Unid. de Medida" text,
    "Qtde." text,
    "Valor Unitário (R$)" text,
    "Valor Total (R$)" text,
    nf_c4ai_id text
);


ALTER TABLE public.docitems_f0236512 OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 23586)
-- Name: docitems_f1ecd601; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docitems_f1ecd601 (
    "Grupo" text,
    "Item" text,
    "Unidade" text,
    "Quantidade" text,
    "Valor Unitário (R$)" text,
    "Valor Total (R$)" text,
    "Operações" text,
    nf_c4ai_id text
);


ALTER TABLE public.docitems_f1ecd601 OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 23567)
-- Name: extractlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.extractlog (
    "initTime" text,
    "endTime" text,
    "liberadaContasOnline" text,
    "fimPrestacaoContasAno" text,
    "faseId" text,
    "entidadeId" text,
    "situacaoId" text,
    "tipoConcessaoId" text,
    "entidadeCnpj" text,
    "codIbge" text,
    "fimVigenciaConvenio" text,
    "pcId" text,
    "tipoConcessaoNome" text,
    "tipoConcessaoConvenio" text,
    "colId" text,
    "fimVigenciaConvenioAno" text,
    "situacaoPCId" text,
    "fimPrestacaoContas" text,
    "faseNome" text,
    "ufNome" text,
    "pcIncluida" text,
    "tipoConcessaoRepasse" text,
    "programaId" text,
    "anoConcessao" text,
    "situacaoNome" text,
    "entidadeNome" text,
    "dataAssinaturaConvenio" text,
    "municipioId" text,
    "valorTotalPago" text,
    "totalRegistros" text,
    "demandaMonitorada" text,
    "tipoBotao" text,
    "permiteAcessoSigecon" text,
    "programaNome" text,
    "municipioNome" text,
    "situacaoPCNome" text,
    sha256_id text NOT NULL
);


ALTER TABLE public.extractlog OWNER TO postgres;

--
-- TOC entry 2980 (class 0 OID 23539)
-- Dependencies: 191
-- Data for Name: dataidentification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dataidentification ("Tipo de Concessão:", "CNPJ:", "Nome da Entidade:", "Programa:", "Nº da Transferência:", "Vigência:", "Situação:", "Prazo para PC:", "Município/UF:", "Unidade Executora:", "Objeto Executado", "Objetivo", sha256_id) FROM stdin;
REPASSE	46.395.000/0001-39	PREF MUN DE SAO PAULO	PROG.NACIONAL DE ALIMENTAÇÃO ESCOLAR	ALIMENTAÇÃO ESCOLAR / 2019	01/01/2019 - 31/12/2019	Adimplente	01/03/2021	SAO PAULO-SP	NA	Aquisição de gêneros alimentícios	Contribuir para o crescimento e o desenvolvimento biopsicossocial, a aprendizagem, o rendimento escolar e a formação de práticas alimentares saudáveis dos alunos, por meio de ações de educação alimentar e nutricional e da oferta de refeições que cubram as suas necessidades nutricionais durante o período letivo.	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6
REPASSE	45.358.249/0001-01	PREF MUN DE SAO CARLOS	PROG.NACIONAL DE ALIMENTAÇÃO ESCOLAR	ALIMENTAÇÃO ESCOLAR / 2019	01/01/2019 - 31/12/2019\n\n	Adimplente	01/03/2021	SAO CARLOS-SP		Aquisição de gêneros alimentícios	Contribuir para o crescimento e o desenvolvimento biopsicossocial, a aprendizagem, o rendimento escolar e a formação de práticas alimentares saudáveis dos alunos, por meio de ações de educação alimentar e nutricional e da oferta de refeições que cubram as suas necessidades nutricionais durante o período letivo.	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f
REPASSE	45.358.249/0001-01	PREF MUN DE SAO CARLOS	PROG.NACIONAL DE ALIMENTAÇÃO ESCOLAR	ALIMENTAÇÃO ESCOLAR / 2018	01/01/2018 - 31/12/2018\n\n	Adimplente	14/06/2019	SAO CARLOS-SP		Aquisição de gêneros alimentícios	Contribuir para o crescimento e o desenvolvimento biopsicossocial, a aprendizagem, o rendimento escolar e a formação de práticas alimentares saudáveis dos alunos, por meio de ações de educação alimentar e nutricional e da oferta de refeições que cubram as suas necessidades nutricionais durante o período letivo.	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321
REPASSE	45.358.249/0001-01	PREF MUN DE SAO CARLOS	PROG.NACIONAL DE ALIMENTAÇÃO ESCOLAR	ALIMENTAÇÃO ESCOLAR / 2017	01/01/2017 - 31/12/2017\n\n	Adimplente	15/02/2018	SAO CARLOS-SP		Aquisição de gêneros alimentícios	Contribuir para o crescimento e o desenvolvimento biopsicossocial, a aprendizagem, o rendimento escolar e a formação de práticas alimentares saudáveis dos alunos, por meio de ações de educação alimentar e nutricional e da oferta de refeições que cubram as suas necessidades nutricionais durante o período letivo.	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce
REPASSE	45.358.249/0001-01	PREF MUN DE SAO CARLOS	PROG.NACIONAL DE ALIMENTAÇÃO ESCOLAR	ALIMENTAÇÃO ESCOLAR / 2016	01/01/2016 - 31/12/2016\n\n	Adimplente	21/08/2017	SAO CARLOS-SP		Aquisição de gêneros alimentícios	Contribuir para o crescimento e o desenvolvimento biopsicossocial, a aprendizagem, o rendimento escolar e a formação de práticas alimentares saudáveis dos alunos, por meio de ações de educação alimentar e nutricional e da oferta de refeições que cubram as suas necessidades nutricionais durante o período letivo.	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a
REPASSE	45.358.249/0001-01	PREF MUN DE SAO CARLOS	PROG.NACIONAL DE ALIMENTAÇÃO ESCOLAR	ALIMENTAÇÃO ESCOLAR / 2015	01/01/2015 - 31/12/2015\n\n	Adimplente	01/04/2016	SAO CARLOS-SP		Aquisição de gêneros alimentícios	Contribuir para o crescimento e o desenvolvimento biopsicossocial, a aprendizagem, o rendimento escolar e a formação de práticas alimentares saudáveis dos alunos, por meio de ações de educação alimentar e nutricional e da oferta de refeições que cubram as suas necessidades nutricionais durante o período letivo.	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9
REPASSE	45.358.249/0001-01	PREF MUN DE SAO CARLOS	PROG.NACIONAL DE ALIMENTAÇÃO ESCOLAR	ALIMENTAÇÃO ESCOLAR / 2014	01/01/2014 - 31/12/2014\n\n	Adimplente	15/02/2015	SAO CARLOS-SP		Aquisição de gêneros alimentícios	Contribuir para o crescimento e o desenvolvimento biopsicossocial, a aprendizagem, o rendimento escolar e a formação de práticas alimentares saudáveis dos alunos, por meio de ações de educação alimentar e nutricional e da oferta de refeições que cubram as suas necessidades nutricionais durante o período letivo.	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426
REPASSE	45.358.249/0001-01	PREF MUN DE SAO CARLOS	PROG.NACIONAL DE ALIMENTAÇÃO ESCOLAR	ALIMENTAÇÃO ESCOLAR / 2013	01/01/2013 - 31/12/2013\n\n	Adimplente	30/06/2014	SAO CARLOS-SP		Aquisição de gêneros alimentícios	Contribuir para o crescimento e o desenvolvimento biopsicossocial, a aprendizagem, o rendimento escolar e a formação de práticas alimentares saudáveis dos alunos, por meio de ações de educação alimentar e nutricional e da oferta de refeições que cubram as suas necessidades nutricionais durante o período letivo.	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8
\.


--
-- TOC entry 2981 (class 0 OID 23547)
-- Dependencies: 192
-- Data for Name: docinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.docinfo ("tablePageN", "rowN", "CNPJ/CPF", "Fornecedor", "Tipo de Documento", "Chave de Acesso da Nota Fiscal", "Número do Documento", "Número de Série", "Data da Emissão do Documento", "Valor Total do Documento", "Desconto", "Data de Entrega", "Valor Apropriado/A Pagar", "Valor de Custeio", "Numero de Inscricao DAP", "Observacao", sha256_id, nf_c4ai_id) FROM stdin;
1	0	10.976.220/0001-09	ITAVOL COMERCIAL EIRELI	Nota Fiscal Eletrônica	41191210976220000109550010000041201000056442	4120	1.0	09/12/2019	380.142,00	0,00	 	380.142,00	0,00	 	 	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	79a1af38c777fa214c2b47a4c87a538fcdb5a1bf4e796437fc192f8830e771b3
1	1	11.402.980/0001-75	COOPERATIVA DOS PRODUTORES RURAIS E DA AGRICULTURA FAMILIAR DO MUNICIPIO DE JUQUIA - COOPAFARGA	Nota Fiscal Eletrônica	35190211402980000175550010000061141200000000	6114	1.0	08/02/2019	40.391,40	0,00	08/02/2019	40.391,40	0,00	SDW1140298000012709191128	Despesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	f5603f8b5c63ae8013234cd4f3b172a7d8b25c9a5a3ac1bd2df208c6da05773e
1	2	07.026.998/0001-42	COOPERATIVA DOS BANANICULTORES E AGRICULTORES DE MIRACATU - COOBAM	Nota Fiscal Eletrônica	35190407026998000142550010000024641000024648	2464	1.0	23/04/2019	16.537,80	0,00	23/04/2019	16.537,80	0,00	SDW0702699800011709210259	Despesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	b9ed576190a8eac23b03fdc1ceb8eb5ed863338e28e76c250a1e0040c4195376
1	3	10.218.502/0001-47	COOPERATIVA AGROPECUARIA DE PRODUTOS SUSTENTAVEIS DO GUAPIRUVU - COOPERAGUA	Nota Fiscal Eletrônica	35190210218502000147550010000011111000120053	1111	1.0	11/02/2019	19.500,60	0,00	12/02/2019	19.500,60	0,00	SDW1021850200012511200932	Despesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	4a585d98285ea1bb2f18c41fc26be52a0d246185db14a7374647c62171fb4943
1	4	62.546.387/0001-33	PREDILECTA ALIMENTOS LTDA	Nota Fiscal Eletrônica	35181162546387000133550050008907741740408039	890774	5.0	09/11/2018	69.888,00	0,00	09/11/2018	69.888,00	0,00	 	 	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	0b52aff5e12bcc65eb27993a234add4d9a9c45a9e6f3ffa2f9ce5d0a3cc4d2c7
1	5	00.861.664/0001-45	COOPERATIVA DE PROD AGROPECUARIA NOVA SANTA RITA LTDA	Nota Fiscal Eletrônica	43190800861664000145550010000758051533358387	75805	1.0	16/08/2019	111.387,00	0,00	 	111.387,00	0,00	SDW0086166400010911200316	Despesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	01bac19e36b683639a74f63ac9d9d89b9d087f60c4c07039d02db6532382875e
1	6	52.547.072/0001-57	FRESKITO PRODUTOS ALIMENTICIOS LTDA	Nota Fiscal Eletrônica	35190552547072000157550010000817121000817127	81712	1.0	13/05/2019	197.447,23	0,00	14/05/2019	197.447,23	0,00	 	 	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	049bf205b0846f516dd478c2a7d373b1f48c8898712361f79a0413491fd50bd5
1	7	52.547.072/0001-57	FRESKITO PRODUTOS ALIMENTICIOS LTDA	Nota Fiscal Eletrônica	35190352547072000157550010000742631000742636	74263	1.0	26/03/2019	110.346,60	0,00	27/03/2019	110.346,60	0,00	 	 	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	b6ca0784f1afd777616c872e748853358d398df39f7cadc9f74f4a65486a3f62
1	8	07.798.373/0001-07	GRANFOOD ALIMENTOS EIRELI	Nota Fiscal Eletrônica	35191107798373000107550010000041341915858030	4134	1.0	14/11/2019	11.968,20	0,00	14/11/2019	11.968,20	0,00	 	 	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	021d1750a8c9e665022dce7c5578c94dd2a10e06e425dd4a6af7a67794aa72e3
1	9	39.787.056/0001-73	TANGARA IMPORTADORA E EXPORTADORA SA	Nota Fiscal Eletrônica	32190239787056000173550010002380791478963656	238079	1.0	19/02/2019	337.250,00	0,00	19/02/2019	337.250,00	0,00	 	 	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	fec38c8cb0d648cfa8864af62f72ccb0fc50d9d32a8fee8958067f3f26c752ed
1	10	00.861.664/0001-45	COOPERATIVA DE PROD AGROPECUARIA NOVA SANTA RITA LTDA	Nota Fiscal Eletrônica	43190200861664000145550010000701101899221196	70110	1.0	15/02/2019	61.725,30	0,00	 	61.725,30	0,00	SDW0086166400010911200316	Despesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	ed65747be130d87a792bb3d911807c4591ba43c924738612caf948751386a2a7
1	11	22.120.304/0001-25	G NOVA COMERCIO DE PRODUTOS ALIMENTICIOS EIRELI	Nota Fiscal Eletrônica	35190922120304000125550010000008661764144144	866	1.0	13/09/2019	248.371,20	0,00	13/09/2019	248.371,20	0,00	 	 	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	9ed382efcad00354f036e75f532b05feaf55bc23dc2fccc11b4cb33d953703ae
1	12	14.213.014/0001-06	COOPERATIVA AGROECOLOGICA DOS PRODUTORES RURAIS E DE AGUA LIMPA DA REGIAO SUL DE SAO PAULO-COOPERAPAS	Nota Fiscal Eletrônica	35181114213014000106550000000004771120004770	477	0.0	06/11/2018	931,70	0,00	06/11/2018	931,70	0,00	SDW1421301400011709181113	Despesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	e60335f172a6e1aa5e50f1c022e22e7c9453526ccaa542183983839d19da5a86
1	13	07.798.373/0001-07	GRANFOOD ALIMENTOS EIRELI	Nota Fiscal Eletrônica	35191107798373000107550010000041381937537910	4138	1.0	18/11/2019	10.921,80	0,00	18/11/2019	10.921,80	0,00	 	 	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	a3d82a15f8a69008e1a86560d232360e477e2b28561b6e7641a84c9dfb6fc2d8
1	14	07.026.998/0001-42	COOPERATIVA DOS BANANICULTORES E AGRICULTORES DE MIRACATU - COOBAM	Nota Fiscal Eletrônica	35190207026998000142550010000022851000022850	2285	1.0	11/02/2019	22.381,80	0,00	11/02/2019	21.294,00	0,00	SDW0702699800011709210259	Despesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	74d71e7776586620926ff8598dbc6b65fa76a8da4eebffb05517a1cbfdbdcf02
1	15	01.731.083/0001-51	PANIFICADORA E DISTRIBUIDORA RE ALI JUNIOR LTDA	Nota Fiscal Eletrônica	35190701731083000151550010001835521756197647	183552	1.0	25/07/2019	145.195,20	0,00	 	145.195,20	0,00	 	 	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	8e7b4f4843a1692ccca0522c64a456bcd4c45825e974f745a6c3caaaa4dc44eb
1	16	01.731.083/0001-51	PANIFICADORA E DISTRIBUIDORA RE ALI JUNIOR LTDA	Nota Fiscal Eletrônica	35190801731083000151550010001842811368068126	184281	1.0	08/08/2019	6.868,80	0,00	 	6.868,80	0,00	 	 	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	f84a63b62ca87a86e2d9ed166e46b80f2fdd9929a90a4b162542ea073207651f
1	17	51.377.935/0001-22	MASSAS ALIMENTICIAS DA ROZ LTDA	Nota Fiscal Eletrônica	35181251377935000122550010000647021116463654	64702	1.0	18/12/2018	30.693,60	0,00	18/12/2018	30.693,60	0,00	 	 	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	bf9469e47a98810b7a24166f8f9f817c8698cac678324e0959200cb45c1b35ed
1	18	11.402.980/0001-75	COOPERATIVA DOS PRODUTORES RURAIS E DA AGRICULTURA FAMILIAR DO MUNICIPIO DE JUQUIA - COOPAFARGA	Nota Fiscal Eletrônica	35190211402980000175550010000061031200000006	6103	1.0	08/02/2019	11.865,00	0,00	08/02/2019	11.865,00	0,00	SDW1140298000012709191128	Despesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	1dfb03a8658aee2d3d05ec279a7f167ae965cac6e9ec12d7647a1ff805f9f6a2
1	19	03.938.789/0006-29	ALIMENTOS DALLAS INDUSTRIA E COMERCIO LTDA	Nota Fiscal Eletrônica	35191003938789000629550010000643771000651112	64377	1.0	31/10/2019	60.120,00	0,00	04/11/2019	60.120,00	0,00	 	 	2ffdca7a983dac84100d118ce5a52dbb95761785eb40a6fa878bafc4245f20c6	9cb7d5e00b815838594ac07deb61831cd1da549898979183686ccf8db400721b
\N	\N	29.599.422/0001-07	COASCRE - COOPERATIVA DOS AGRICULTORES DE SAO CARLOS E REGIAO	Nota Fiscal Eletrônica	35190329599422000107550010000001771100001774	177	1.0	28/03/2019	7.594,75	0,00	 	7.594,75	7.594,75	SDW2959942200011702200921	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	f3defaedb51531f9df533e6fa10da174344bfdf059c8e4b4fa624639f394a678
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	35190200024415000103550010000922391000919240	92239	1.0	01/02/2019	16.156,56	0,00	04/02/2019	16.156,56	16.156,56	 	 	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	175efa38f7c5b9c484daff51932f732f2762e1dbd69480b140e71731e03b8677
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	35190200024415000103550010000923671000920540	92367	1.0	08/02/2019	5.568,08	0,00	11/02/2019	5.568,08	5.568,08	 	 	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	7d3dc389a58a187790951ba77733ea21796e9fa2f87b838c7b99d05d98c80142
\N	\N	13.385.804/0001-06	COOPERATIVA DOS PRODUTORES DE AGRICULTURA DIVERSIFICADA DE PORTO FERREIRA E REGIAO - COOPROFER	Nota Fiscal Eletrônica	35191013385804000106550010000013521090756960	1352	1.0	08/10/2019	8.143,30	0,00	 	8.143,30	8.143,30	SDW1338580400011809200940	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	ae84191494aa4b40d7bf050d9845098478d12d98198cf600d25081a7ac7b503c
\N	\N	21.029.614/0001-76	JULIANO OLIVEIRA DA COSTA	Nota Fiscal Produtor Rural	 	0060	 	01/07/2019	820,63	 	01/07/2019	0,00	820,63	 	 	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	81821941fe4f6bacc4501734f3750e1dd15f8617ffd2ba95e93affaeb2606ff5
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	35190300024415000103550010000929531000926426	92953	1.0	08/03/2019	2.806,86	0,00	11/03/2019	2.806,86	2.806,86	 	 	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	8f1601dbece2bc47f5a6587b046ff21180a6777bbaa3ec99b32e757dd0008760
\N	\N	10.888.284/0001-58	LINDAMIRA APARECIDA TEODORO E OUTRO	Nota Fiscal Produtor Rural	 	0048	 	07/11/2019	1.260,71	 	07/11/2019	1.260,71	0,00	 	 	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	d81830467753137ff301862cf1526b9c7afa1a0e5b165f8ae925c6a148c39316
\N	\N	29.599.422/0001-07	COASCRE - COOPERATIVA DOS AGRICULTORES DE SAO CARLOS E REGIAO	Nota Fiscal Eletrônica	35190229599422000107550010000001591100001594	159	1.0	21/02/2019	14.321,68	0,00	 	14.321,68	14.321,68	SDW2959942200011702200921	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	60c46e02b0a97350336701936f07711f23614d5c88f57c4495ddaa8928f2f2ee
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	35190200024415000103550010000923681000920556	92368	1.0	08/02/2019	9.940,80	0,00	11/02/2019	9.940,80	9.940,80	 	 	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	0820e5ad97bc0822524c238056d790fff26060a2b07fa681bec70f6e8519b3e6
\N	\N	21.029.614/0001-76	JULIANO OLIVEIRA DA COSTA	Nota Fiscal Produtor Rural	 	0059	 	27/06/2019	13.462,44	 	27/06/2019	0,00	13.462,44	 	 	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	3d9f488b871f517904056766345c5056273c5d64d5b56069d8aa33532c48ce7d
\N	\N	13.385.804/0001-06	COOPERATIVA DOS PRODUTORES DE AGRICULTURA DIVERSIFICADA DE PORTO FERREIRA E REGIAO - COOPROFER	Nota Fiscal Eletrônica	35191013385804000106550010000013561887237101	1356	1.0	23/10/2019	9.486,68	0,00	 	9.486,68	9.486,67	SDW1338580400011809200940	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	ae6287feb2fd450aade17d2703efcb34ab1f5415ad0e6722c447291ff2d7ed53
\N	\N	29.599.422/0001-07	COASCRE - COOPERATIVA DOS AGRICULTORES DE SAO CARLOS E REGIAO	Nota Fiscal Eletrônica	35191129599422000107550010000003671100003670	367	1.0	29/11/2019	6.502,50	0,00	 	6.502,50	6.502,50	SDW2959942200011702200921	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	8ace5432a748b638d9ce5df3c043eab34c036038d3eb6181c06ef501408a5279
\N	\N	13.138.463/0001-66	ADRIANO RODRIGO SCHENEVIZ	Nota Fiscal Produtor Rural	 	0107	 	04/07/2019	8.478,65	 	04/07/2019	0,00	8.478,65	 	 	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	f1f3c9ea20fe77cc507b47112070080fe803089cd22880008a0e4e6d9b9b3811
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	35190300024415000103550010000929541000926431	92954	1.0	08/03/2019	12.779,20	0,00	11/03/2019	12.779,20	12.779,20	 	 	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	5135b56d91d7bb2f7a39c448d9f681a167dbe8c83c1ddccf931adeae9f7dbf52
\N	\N	29.599.422/0001-07	COASCRE - COOPERATIVA DOS AGRICULTORES DE SAO CARLOS E REGIAO	Nota Fiscal Eletrônica	35190329599422000107550010000001691100001691	169	1.0	13/03/2019	14.000,09	0,00	 	14.000,09	14.000,09	SDW2959942200011702200921	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	dd20136b16be79b73ca70b20f4b13e84d173e94805d5e0483406e3326f5428ec
\N	\N	26.329.707/0001-30	ROSANGELA SOARES GUATURA PRATAVIEIRA	Nota Fiscal Produtor Rural	 	008	 	28/08/2019	2.785,81	 	28/08/2019	2.785,81	0,00	SDW2959942200010404180108	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	874d336e82da84e273ed4a9d2a80b4bde054ba57b0251600abe859f9e09292dc
\N	\N	12.804.372/0001-50	JELLYFRUIT - FABRICACAO E DISTRIBUICAO DE PRODUTOS ALIMENTICIOS LTDA	Nota Fiscal Eletrônica	35190412804372000150550010000344821927210386	34482	1.0	01/04/2019	19.358,19	0,00	02/04/2019	19.358,19	19.358,19	 	 	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	9795f754011a89cb6efe7c5c0d466c892e62e157aa7466ec9aded156da9447ab
\N	\N	17.737.130/0001-04	ASSOCIACAO DOS PRODUTORES RURAIS DO SITIO LAMBARI DE CASA BRANCA	Nota Fiscal Eletrônica	35190417737130000104550010000003891796855174	389	1.0	09/04/2019	3.749,00	0,00	09/04/2019	3.749,00	3.749,00	SDW1773713000012702201131	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	a670b75fae2570b61a06d5f1fdbc85a1d53e91d1a4d6cc9c303b3c4ec37956c7
\N	\N	29.599.422/0001-07	COASCRE - COOPERATIVA DOS AGRICULTORES DE SAO CARLOS E REGIAO	Nota Fiscal Eletrônica	35190829599422000107550010000002671100002670	267	1.0	07/08/2019	24.782,55	0,00	 	24.782,55	24.782,55	SDW2959942200011702200921	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	b2c9e53cb618353a1b13e2e32903c52944936eb19d86520c695155fb0fa82452
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	35190200024415000103550010000923641000920514	92364	1.0	08/02/2019	6.846,00	0,00	11/02/2019	6.846,00	6.846,00	 	 	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f	2582e11e4851419ca9a0d93c19ea6ceb347fa074a4d0176cc4b3f6275506ca3c
\N	\N	53.437.315/0001-67	COMERCIAL JOAO AFONSO LTDA	Nota Fiscal Eletrônica	35180553437315000167550010002112051002112054	211205	1.0	14/05/2018	961,42	0,00	15/05/2018	961,42	961,42	 	 	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	fc4d58c5267f2ae12dc5f0bfd8ed0b3ef887c45988177d60e177f08ae64f4d67
\N	\N	17.737.130/0001-04	ASSOCIACAO DOS PRODUTORES RURAIS DO SITIO LAMBARI DE CASA BRANCA	Nota Fiscal Eletrônica	35181217737130000104550010000003711138909729	371	1.0	03/12/2018	3.260,00	0,00	03/12/2018	3.260,00	3.260,00	SDW1773713000012702201131	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	a3415e5f31572462b07a6b00309fc26b12c7f046a37578d5ba0c74413c78b3fb
\N	\N	10.888.218/0001-88	MARIA DE LOURDES CARVALHO DA SILVA E OUTRO	Nota Fiscal Produtor Rural	 	0018	 	16/10/2018	2.412,38	 	16/10/2018	2.412,38	0,00	 	 	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	e00ae9311a0804bf9e9b1ef0d608a48695217411df3981c35c2870a7e54f57a2
\N	\N	20.268.436/0001-73	ASSOCIACAO DOS PRODUTORES RURAIS ASSENTADOS DO PROJETO DE DESENVOLVIMENTO SUSTENTAVEL 21 DE DEZEMBRO E REGIAO - APADER	Nota Fiscal Produtor Rural	 	685	 	01/11/2018	1.498,00	 	01/11/2018	1.498,00	0,00	SDW2026843600010403200204	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	7ca0edffdffa21aea1cf9cbfcdea543ba9d2bed21c8d71193b1107bac73c686b
\N	\N	13.138.463/0001-66	ADRIANO RODRIGO SCHENEVIZ	Nota Fiscal Produtor Rural	 	0101	 	11/09/2018	5.880,62	 	11/09/2018	5.880,62	0,00	 	 	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	f44573ba27e29f57a1156c0a3acb5a9d90e7cae4691aaebcf1db045f1fb28a41
\N	\N	53.437.315/0001-67	COMERCIAL JOAO AFONSO LTDA	Nota Fiscal Eletrônica	35180653437315000167550010002140851002140853	214085	1.0	13/06/2018	769,56	0,00	14/06/2018	769,56	769,56	 	 	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	dfaab951664a4d51bafca170fe427a5df347e0bbf4f8233d4dd6b1c2a63b7bd0
\N	\N	20.268.436/0001-73	ASSOCIACAO DOS PRODUTORES RURAIS ASSENTADOS DO PROJETO DE DESENVOLVIMENTO SUSTENTAVEL 21 DE DEZEMBRO E REGIAO - APADER	Nota Fiscal Produtor Rural	 	643	 	04/10/2018	8.136,48	 	04/10/2018	8.136,48	0,00	SDW2026843600010403200204	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	551bfd60a6b608ec3f91d24bb33ab5bd04bcb1f6a4a4f89f6d74404e1a95995b
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	35180500024415000103550010000874111000870797	87411	1.0	18/05/2018	7.093,20	0,00	21/05/2018	7.093,20	7.093,20	 	 	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	5af6e6a9e16746465381c642fa10fecfcbddeddcfa2e77ae6af49d9d73ea350d
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	35180300024415000103550010000861991000858658	86199	1.0	16/03/2018	5.145,00	0,00	20/03/2018	5.145,00	5.145,00	 	 	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	04d7983c1be9ff5f754510da25b5a058a6eaa03df2fb3c1db7da9f76457c3b8a
\N	\N	02.886.959/0001-00	MULT BEEF COMERCIAL EIRELI	Nota Fiscal Eletrônica	35180502886959000100550010000478151213132227	47815	1.0	02/05/2018	21.965,32	0,00	02/05/2018	21.965,32	21.965,32	 	 	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	402db242fdd25a7b3ce2db51525e1b6780d72b07b88373e0acdcf0d38042ac4f
\N	\N	51.377.935/0001-22	MASSAS ALIMENTICIAS DA ROZ LTDA	Nota Fiscal Eletrônica	35180751377935000122550010000618651167035533	61865	1.0	27/07/2018	2.535,10	0,00	30/07/2018	2.535,10	2.535,10	 	 	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	32bc155f7a4673363306c203bb2fabc5908eb9f4cdd2008a2293cf02f5c611fd
\N	\N	12.804.372/0001-50	JELLYFRUIT - FABRICACAO E DISTRIBUICAO DE PRODUTOS ALIMENTICIOS LTDA	Nota Fiscal Eletrônica	35181012804372000150550010000238541417233614	23854	1.0	01/10/2018	8.261,55	0,00	02/10/2018	8.261,55	8.261,55	 	 	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	fdf38e4423d1f4b1837b765169eb73e90080a74e658d5730b427404b3044ec86
\N	\N	10.888.306/0001-80	SELMA SILVANA BOTTI GADOLFINI E OUTRO	Nota Fiscal Produtor Rural	 	00664	 	24/04/2018	571,97	 	24/04/2018	571,97	0,00	 	 	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	2d998f920396e1238cf65f202803e5f242a866bff81d02e3c67ea66551ae1237
\N	\N	53.437.315/0001-67	COMERCIAL JOAO AFONSO LTDA	Nota Fiscal Eletrônica	35180453437315000167550010002094851002094855	209485	1.0	26/04/2018	1.000,51	0,00	27/04/2018	1.000,51	1.000,51	 	 	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	c98bf7c534b55eda4df0269d903a84637c737e156aaf74a6dfc302f587bd4151
\N	\N	53.437.315/0001-67	COMERCIAL JOAO AFONSO LTDA	Nota Fiscal Eletrônica	35180553437315000167550010002112071002112075	211207	1.0	14/05/2018	34.473,60	0,00	15/05/2018	34.473,60	34.473,60	 	 	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	41f480b5edd7e6885444692a49ebe66fece1dc58171060b79a6a0fbf678bacd4
\N	\N	17.441.893/0001-03	CAROLINA GUATURA PRATAVIEIRA E OUTRA	Nota Fiscal Produtor Rural	 	0074	 	07/11/2018	2.357,50	 	07/11/2018	2.357,50	0,00	 	 	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	8da9fa29bf84765830600d12e7df4c8f7c53982943b861aa11bebecbe3fe6e18
\N	\N	12.804.372/0001-50	JELLYFRUIT - FABRICACAO E DISTRIBUICAO DE PRODUTOS ALIMENTICIOS LTDA	Nota Fiscal Eletrônica	35180812804372000150550010000219111022454443	21911	1.0	27/08/2018	3.778,80	0,00	28/08/2018	3.778,80	3.778,80	 	 	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	4cdbe2f1a1ef20454f01734dd79d30ae82064de3153425105d838fb714c2f1e4
\N	\N	53.437.315/0001-67	COMERCIAL JOAO AFONSO LTDA	Nota Fiscal Eletrônica	35181153437315000167550010002292871002292870	229287	1.0	16/11/2018	6.862,80	0,00	19/11/2018	6.862,80	6.862,80	 	 	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	a3f81d726fb7c6c0c783ab8e91427421846575b18e6ba96ff275cdb8d1ee18df
\N	\N	12.804.372/0001-50	JELLYFRUIT - FABRICACAO E DISTRIBUICAO DE PRODUTOS ALIMENTICIOS LTDA	Nota Fiscal Eletrônica	35180912804372000150550010000230391160680800	23039	1.0	17/09/2018	5.541,15	0,00	18/09/2018	5.541,15	5.541,15	 	 	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	fc0161a4a35a64336fe42ae30d24e9a386352a33229dc63531abc251a4f2b50f
\N	\N	53.437.315/0001-67	COMERCIAL JOAO AFONSO LTDA	Nota Fiscal Eletrônica	35181053437315000167550010002273981002273988	227398	1.0	29/10/2018	6.841,52	0,00	30/10/2018	6.841,52	6.841,52	 	 	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321	2f80073150017214fae5a300add38285302e9be4d3248f395ce307e77f0af598
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	 	083316	 	29/09/2017	6.642,40	 	29/09/2017	6.642,40	0,00	 	 	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	8f2234e594237d7db0ad7ce2a2dedb7e39b3699c84fbb529a7803975e52e40ae
\N	\N	335.611.758-05	SONIA DONIZETTI ZUCCOLOTTO MARCATTO	Nota Fiscal Produtor Rural	 	0180	 	02/08/2017	275,18	 	02/08/2017	275,18	0,00	SDW0335611758052402160353	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	b62d5aa784e33618b72e5ade7fcaf5de16ba5660295139a6f92a0fe0836cf6e4
\N	\N	14.435.120/0001-26	ASSOCIACAO DOS PRODUTORES RURAIS DE TABATINGA - APROTABA	Nota Fiscal Eletrônica	 	129	 	22/02/2017	9.122,38	 	22/02/2017	9.122,38	0,00	SDW1443512000012901190111	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	e60d2e12a6e71704049b8773d8b2b4c85b6ab40d8d637e99924363031d0a9fd9
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	 	82024	 	24/07/2017	2.607,36	 	24/07/2017	2.607,36	0,00	 	 	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	469290cca45c6f3ee5310d243f783b58ed56b1d9ac241d7c04f440839dce7586
\N	\N	20.268.436/0001-73	ASSOCIACAO DOS PRODUTORES RURAIS ASSENTADOS DO PROJETO DE DESENVOLVIMENTO SUSTENTAVEL 21 DE DEZEMBRO E REGIAO - APADER	Nota Fiscal Eletrônica	 	293	 	17/10/2017	11.738,55	 	17/10/2017	11.738,55	0,00	SDW2026843600010403200204	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	586e06b49158a0a25d2719a99ea659bf77c4334c9b7a9647b0f831cf02799124
\N	\N	19.664.460/0001-42	SERGIO APARECIDO MARINO	Nota Fiscal Produtor Rural	 	0121	 	06/09/2017	792,32	 	06/09/2017	792,32	0,00	SDW0056442228292701160244	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	414c368dbb9bbc2e7af4a021724fdbd50fee19d8d89c964a24298577addce60e
\N	\N	14.435.120/0001-26	ASSOCIACAO DOS PRODUTORES RURAIS DE TABATINGA - APROTABA	Nota Fiscal Eletrônica	 	130	 	22/02/2017	6.379,45	 	22/02/2017	6.379,45	0,00	SDW1443512000012901190111	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	38cc60d56dfb569ec4e04a689e4fe91ab39b61ea713b18934702ba6830eb0b3d
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	 	081019	 	26/05/2017	4.692,00	 	29/05/2017	4.692,00	0,00	 	 	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	76e011e40e4deba5ebd649887f18b55e818ef82c912cc5b2e68af4991e7f1a42
\N	\N	12.108.648/0001-65	CELIO SANTIN MARIANO	Nota Fiscal Produtor Rural	 	0158	 	25/09/2017	1.835,29	 	25/09/2017	1.835,29	0,00	SDW0027761498832609161125	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	341a7d1c7648e9307e8462598e07b0b8ffa8d90b81c72b6b4db8af27172ff131
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	 	081020	 	26/05/2017	18.427,60	 	29/05/2017	18.427,60	0,00	 	 	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	410b1cecea8c790a1ed6f75143a266e8977e768ee87e23874b034311c7c4c669
\N	\N	26.313.029/0001-17	ASSOCIACAO DOS PRODUTORES DE ALIMENTOS SAUDAVEIS ORGULHO DO CAMPO	Nota Fiscal Eletrônica	 	0290	 	27/11/2017	6.208,84	 	27/11/2017	6.208,84	0,00	SDW2631302900010606190335	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	891deeebb7db59254d816da8971e4b9a0c7396837338d850b769755ea99ede4f
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	 	081021	 	26/05/2017	8.631,00	 	29/05/2017	8.631,00	0,00	 	 	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	d1a64c8a09837a99d5aee056484f380848f7c0f4a617655475657efb9cc95458
\N	\N	23.423.968/0001-26	ANDERSON PEREIRA DOS REIS	Nota Fiscal Produtor Rural	 	0013	 	15/03/2017	3.470,65	 	15/03/2017	3.470,65	0,00	IN-SP014100000387230317	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	5b720c5ae5d3f3b71158aabeded415402a4ed3df7a3e523f5d365d8046e9cd8c
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	 	82025	 	21/07/2017	9.246,00	 	24/07/2017	9.246,00	0,00	 	 	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	3e24c9e6a11b106acdbf49374520cd5cf772e0c3e5424277567a1742ff565cb3
\N	\N	15.500.029/0001-00	EDNEIA APARECIDA MESSA E OUTROS	Nota Fiscal Produtor Rural	 	0115	 	14/12/2017	3.008,60	 	14/12/2017	3.008,60	0,00	SDW0106623548181206120134	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	8bd3f4d7cdd84df209dc711bb0601605c15f8bf48a1108738ad5dd6ed6cd517c
\N	\N	08.424.680/0001-82	OTAVIO ROBERTO	Nota Fiscal Produtor Rural	 	00526	 	04/08/2017	4.876,95	 	04/08/2017	4.876,95	0,00	SDW0098856378930110120441	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	6ca9a3efe0337353dad73fd654b50ee430b729597bf1c83227776853f36987ff
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	 	084517	 	01/12/2017	2.907,20	 	04/12/2017	2.907,20	0,00	 	 	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	cc81c10e54a3d89e8f78f48cb4e8aa10fccc025dabce5f2f00f0fbe7009498d2
\N	\N	11.174.198/0001-46	JOSUE LUIZ PEREIRA	Nota Fiscal Produtor Rural	 	0250	 	05/12/2017	482,21	 	05/12/2017	482,21	0,00	SDW0092560668582008150324	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	2386f8591ae62c6675aaedd34e0004f45df7810618fba90cf385dc8c3bc8e35f
\N	\N	364.477.058-10	CAROLINA GUATURA PRATAVIEIRA	Nota Fiscal Produtor Rural	 	067	 	18/09/2017	4.831,90	 	18/09/2017	4.831,90	0,00	SDW0364477058100510161006	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	56e874fb198e85d8726832e207833952571b252a54e46af975ba9b73a6410c6a
\N	\N	12.108.648/0001-65	CELIO SANTIN MARIANO	Nota Fiscal Produtor Rural	 	0160	 	20/11/2017	996,31	 	20/11/2017	996,31	0,00	SDW0027761498832609161125	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce	5b7178478f8560dcf91f447b48124d8b91674ea87886d2dce884776b533d9ff0
\N	\N	02.886.959/0001-00	MULT BEEF COMERCIAL EIRELI	Nota Fiscal Eletrônica	 	027970	 	28/03/2016	28.342,00	 	28/03/2016	28.342,00	0,00	 	 	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	5be063964a14031b5fded9627d0e2b1bf9c3d17f5f169d140a29934809e1a46a
\N	\N	027.761.498-83	CELIO SANTIN MARIANO	Nota Fiscal Produtor Rural	 	00153	 	12/07/2016	542,50	 	12/07/2016	542,50	0,00	SDW0027761498831406100208	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	953a4a95615556983b3a082b3483e2891244ea498b730f30e17392653b388abd
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	 	073946	 	27/05/2016	8.662,08	 	30/05/2016	8.662,08	0,00	 	 	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	81c60b22caf77f2f385a07e5bd679adc96f4e1b4ba349e89c4173ef78a7afc56
\N	\N	74.555.541/0001-12	MODOLOCAMPI AGRICOLA LTDA	Nota Fiscal Eletrônica	 	187884	 	14/03/2016	1.726,80	 	15/03/2016	1.726,80	0,00	 	 	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	f88db015e0831c9b9340ce276bec5a2d04c8c166601d132850dfa2774d8521f5
\N	\N	335.611.758-05	SONIA DONIZETTI ZUCCOLOTTO MARCATTO	Nota Fiscal Produtor Rural	 	0173	 	11/07/2016	8.944,16	 	11/07/2016	8.944,16	0,00	SDW0335611758051412090225	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	1c31ff1b35fd5ec0ee0fca7ff8af6b10003c9e6e0583f0da92748efaff3664f0
\N	\N	02.886.959/0001-00	MULT BEEF COMERCIAL EIRELI	Nota Fiscal Eletrônica	 	028561	 	24/04/2016	23.680,00	 	24/04/2016	23.680,00	0,00	 	 	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	aa0b0d669be6319417f20b01ae5fc07aba12c917c5f2340d451dfe0a134e8871
\N	\N	027.761.498-83	CELIO SANTIN MARIANO	Nota Fiscal Produtor Rural	 	0154	 	14/09/2016	1.419,40	 	14/09/2016	1.419,40	0,00	SDW0027761498831406100208	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	7841b2dcb76959d964c08fd84dbc9612dfabdfdf54274472344740afae00c73b
\N	\N	335.611.758-05	SONIA DONIZETTI ZUCCOLOTTO MARCATTO	Nota Fiscal Produtor Rural	 	162	 	07/03/2016	788,86	 	07/03/2016	788,86	0,00	SDW0335611758051412090225	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	97eec5d812143362b3559f02a114f91af16976b526fab9a5e3989096d89e6411
\N	\N	57.312.167/0001-05	CATHITA COMERCIALIZACAO E DISTRIBUICAO DE ALIMENTOS EIRELI	Nota Fiscal Eletrônica	 	28809	 	17/06/2016	568,50	 	17/06/2016	568,50	0,00	 	 	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	4e33b9179db3c95b120efeb7097804970b36aebc6739508e2e5f2eb695e7fd09
\N	\N	295.896.478-71	ROBSON JOSE CAPPELARO	Nota Fiscal Produtor Rural	 	0068	 	10/06/2016	1.740,00	 	10/06/2016	1.740,00	0,00	SDW0295896478712311120121	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	7d17812f39bfa78fbb53f8fa3d86d02d86e5c7af634c5eec478f75fe078b7bcf
\N	\N	20.163.617/0001-35	COOPERATIVA CENTRAL DOS AGRICULTORES FAMILIARES - COCAF	Nota Fiscal Eletrônica	 	2225	 	06/10/2016	5.584,46	 	06/10/2016	5.584,46	0,00	SDW2016361700010408150940	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	dc7739cd4939bbaef369287119633f85a34296c0358bf3e679ce9e1363ca1203
\N	\N	055.879.638-96	NIVALDO GRIPPA	Nota Fiscal Produtor Rural	 	0163	 	05/04/2016	2.329,54	 	05/04/2016	2.329,54	0,00	SDW0055879638962503100135	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	8f5dc7fd69ce2d6e648ec940bceea7e3d3d8f67737c684a0a1f46009cd5dea98
\N	\N	379.207.918-63	JULIANA REGINA MARIANO	Nota Fiscal Produtor Rural	 	00148	 	12/07/2016	5.501,12	 	12/07/2016	5.501,12	0,00	SDW0379207918631406100141	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	7295fe05de95822c0e2f02af87ebfd37f5ca436a03ba76facfeed2706aee1028
\N	\N	08.528.442/0001-17	NUTRICIONALE COMERCIO DE ALIMENTOS LTDA	Nota Fiscal Eletrônica	 	256173	 	11/05/2016	4.151,40	 	11/05/2016	4.151,40	0,00	 	 	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	5262ce98b202935761698890c126dee30574a27eea070f6645b8a6318a913878
\N	\N	12.804.372/0001-50	JELLYFRUIT - FABRICACAO E DISTRIBUICAO DE PRODUTOS ALIMENTICIOS LTDA	Nota Fiscal Eletrônica	 	3801	 	28/03/2016	444,00	 	29/03/2016	444,00	0,00	 	 	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	e525aa8ee692b3b349cf9ea9efc8c8eacef44ed109bc6c8557985d9c5dacc7a5
\N	\N	01.435.328/0002-84	COOPERATIVA REGIONAL DE COMERCIALIZACAO DO EXTREMO OESTE - COOPEROESTE	Nota Fiscal Eletrônica	 	536684	 	13/12/2016	66.873,60	 	13/12/2016	66.873,60	0,00	SDW0143532800012704121113	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	03bd7dd4076aeda3bea55e0e038c209faac945d8839439b3ba65457073cc26ec
\N	\N	141.512.348-96	JOSE RIVALDO MARINO	Nota Fiscal Produtor Rural	 	011	 	13/12/2016	19.167,88	 	13/12/2016	19.167,88	0,00	SDW0141512348962504121041	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	d568df29223a5ff959ff83cfac89a4902f4fbfac3d335563e68ddff039f8c167
\N	\N	841.273.848-91	ILSO SEBASTIAO MARCHESIN	Nota Fiscal Produtor Rural	 	00446	 	21/06/2016	213,25	 	21/06/2016	213,25	0,00	SDW0841273848911301110914	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	3f775945df2d4f65e7661c5c1220a24f2b5eb070d8f9dccf72b6d02c940b1d99
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	 	073945	 	27/05/2016	9.370,80	 	30/05/2016	9.370,80	0,00	 	 	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	a3b7142c5b2d65ab948ae02cd74bc521079f6edc7aab0a87c162019ce6e833ed
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	 	072526	 	24/03/2016	18.963,54	 	28/03/2016	18.963,54	0,00	 	 	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a	8a5cceadeeb7820ab460652ec9d85caf3610e27fef3b2fbe9efa53dc1b62dbfd
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	 	067902	 	21/08/2015	6.963,60	 	24/08/2015	6.963,60	0,00	 	 	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	e7dae92fcb0d433b6e76f5adde023a520aecf9f96e6bc20e246afa028523b529
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	 	069409	 	23/10/2015	4.611,42	 	26/10/2015	4.611,42	0,00	 	 	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	cc63a01769607aaa9d05fd9f1f8d60ba34528928e2988038b8df3eefc9649ebe
\N	\N	394.002.768-50	DAIANE CORDEIRO DE OLIVEIRA	Nota Fiscal Produtor Rural	 	0047	 	24/11/2015	3.660,29	 	24/11/2015	3.660,29	0,00	 	 	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	3b3a332ce1e36ddabe1cc4c07921702a44d0eb579a82a67dea3845ba887e11e9
\N	\N	027.761.498-83	CELIO SANTIN MARIANO	Nota Fiscal Produtor Rural	 	00143	 	15/05/2015	38,71	 	15/05/2015	38,71	0,00	SDW0027761498831406100208	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	08e7b6871b842bd138720e5e2641194b2e065a6c13962b8ab909ad53740d1038
\N	\N	464.578.108-10	VALDEMAR PRATAVIEIRA	Nota Fiscal Produtor Rural	 	0060	 	08/10/2015	1.864,00	 	08/10/2015	1.864,00	0,00	SDW0464578108101910110304	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	007caa3771c3944fa68ed0b863a7573f83388da6c56a664f9ddb9e5c1988b2ff
\N	\N	15.577.225/0001-82	MM BRASIL ALIMENTOS LTDA.	Nota Fiscal Eletrônica	 	2339	 	27/02/2015	1.185,30	 	27/02/2015	1.185,30	1.185,30	 	 	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	04acb3d09ea6b10a7626a44160f8d3d3ff8b7b298cce9ad141ec45b6c7e052ef
\N	\N	291.515.438-42	ANDREA CRISTINA PINTO LANDGRAF	Nota Fiscal Produtor Rural	 	0058	 	02/12/2015	417,96	 	02/12/2015	417,96	0,00	SDW0291515438422905130252	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	29d06f9dfcefb9cb567bc403f2184cb013afbc777c5856788dd42e8de49f4496
\N	\N	394.002.768-50	DAIANE CORDEIRO DE OLIVEIRA	Nota Fiscal Produtor Rural	 	0040	 	05/05/2015	711,56	 	05/05/2015	711,56	0,00	SDW394002768501006141051	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	539269d9680c84df3540bb71b6d9f1725a924b312fd4953e3a317af96ddc43f2
\N	\N	106.623.548-18	EDNEIA APARECIDA MESSA	Nota Fiscal Produtor Rural	 	072	 	06/07/2015	1.143,45	 	06/07/2015	1.143,45	0,00	SDW0106623548181206120134	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	5eaeccad54fe0f5ed18eab031b9ecee195323232cfef871ee5736b4203c29140
\N	\N	156.109.268-15	ROQUE ZANINETTI	Nota Fiscal Produtor Rural	 	0024	 	08/07/2015	468,00	 	08/07/2015	468,00	0,00	SDW0156109268151812131011	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	81cbe9ab30b05c9650cfdde2a9f760528f3500a00455f955993ab8f5e4f86770
\N	\N	394.002.768-50	DAIANE CORDEIRO DE OLIVEIRA	Nota Fiscal Produtor Rural	 	0044	 	15/07/2015	2.204,00	 	15/07/2015	2.204,00	0,00	SDW394002768501006141051	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	4eb44bb26161062200684c4b52f15ff83985acd83aa27f11e932a4eca4b41774
\N	\N	066.256.399-90	OSMAR CRISPIM LOPES	Nota Fiscal Produtor Rural	 	080	 	26/10/2015	1.111,91	 	26/10/2015	1.111,91	0,00	SDW0056442228292809090147	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	ba86a407f85735cd7ef7114979cc16549794b12a01c411aa074a31ff9cbddb4c
\N	\N	018.595.888-59	ANTONIO DONIZETI COMISSO	Nota Fiscal Produtor Rural	 	0126	 	08/12/2015	6.058,62	 	08/12/2015	6.058,62	0,00	SDW0018595888592202110158	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	4396146a04695dd8d677ce69fe8ba0a5559b3cc11f92d713754328805227dacc
\N	\N	08.800.318/0001-69	SENHORINHA MARQUES E OUTROS	Nota Fiscal Produtor Rural	 	0167	 	18/12/2015	5.711,66	 	18/12/2015	5.711,66	0,00	SP35299060201154900000081	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	160a555a08da06d2daa64c1c5ac1d94b2d925f7155ba4de88ef002d4824882d8
\N	\N	073.207.608-00	DANIEL DOS SANTOS	Nota Fiscal Produtor Rural	 	00130	 	16/10/2015	3.959,75	 	16/10/2015	3.959,75	0,00	SDW0073207608000307200317	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	467a8c81de0f7168bbfb0de7cc779b08cb99c09c40309c88c2a71907320a84bd
\N	\N	394.002.768-50	DAIANE CORDEIRO DE OLIVEIRA	Nota Fiscal Produtor Rural	 	052	 	14/12/2015	458,50	 	14/12/2015	458,50	0,00	SDW394002768501006141051	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	6260f8a107f3e273c7bf0879c128dc6f01e01851027ca94680f2d083690462d2
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	 	068429	 	11/09/2015	4.743,52	 	14/09/2015	4.743,52	0,00	 	 	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	dbe652032e0b2275453a8388894aa2f8c4370cac794c7b9106e837598c2eb847
\N	\N	10.769.055/0001-14	SABOR E SAUDE INDUSTRIA E COMERCIO DE FORMULADOS LTDA	Nota Fiscal Eletrônica	 	8853	 	12/12/2014	6.127,92	 	12/12/2014	6.127,92	6.127,92	 	 	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	9ba58424c1287c71e20804b3daf359a1e4e0d52affbc672624fc3c3c0b5e92d2
\N	\N	00.024.415/0001-03	DISTRIBUIDORA NANCY LTDA	Nota Fiscal Eletrônica	 	067903	 	21/08/2015	2.462,13	 	24/08/2015	2.462,13	0,00	 	 	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	787e5e1d5154f16e6e453a15300201227eeb87f4ceee7a42d7d0c79de289c821
\N	\N	122.217.988-13	EDNA APARECIDA TAGLIALATELA	Nota Fiscal Produtor Rural	 	0105	 	20/08/2015	456,30	 	20/08/2015	456,30	0,00	SDW122217988130309091023	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9	e764105e60aeb770124c871a31c16f0ce8e0bb10ce6dd3fdc2fb9e6856f3bb15
\N	\N	292.082.758-84	LUCIANA CRISTINA ANTONIO	Nota Fiscal Produtor Rural	 	005	 	14/07/2014	645,58	 	14/07/2014	645,58	0,00	SDW0292082758841203140925	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	fbdcbef9a9ac29b266c15fb83f034ba2af1f7bc3ccea9e3ee205b4e70f2e785e
\N	\N	02.886.959/0001-00	MULT BEEF COMERCIAL EIRELI	Nota Fiscal Eletrônica	 	017076	01	08/06/2014	46.055,00	 	08/06/2014	46.055,00	0,00	 	 	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	9af73a2ae817ef11803d26288134a6c934b75d83eb005541e9a14b9c16427401
\N	\N	055.879.638-96	NIVALDO GRIPPA	Nota Fiscal Produtor Rural	 	00128	 	15/04/2014	1.372,54	 	15/04/2014	1.372,54	0,00	SDW0055879638962503100135	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	989ffb50a215fc580a22832caa5e984a28bf08e547c7cce6a70cf6fbf043bf54
\N	\N	380.668.528-27	MARINEIDE RUFINO LOPES	Nota Fiscal Produtor Rural	 	00017	 	16/05/2014	1.711,71	 	16/05/2014	1.711,71	0,00	SDW0380668528270402100349	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	89657d8914e0ab0e5c520fc528504e1950e9ba91fe9df9134e029843dd54dc81
\N	\N	394.002.768-50	DAIANE CORDEIRO DE OLIVEIRA	Nota Fiscal Produtor Rural	 	0011	 	11/09/2014	1.097,36	 	11/09/2014	1.097,36	0,00	SDW394002768501006141051	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	7af814fe8b597b600664a451d11a9c5481af15e4fca285b68338353bc9a74f1c
\N	\N	344.198.468-44	JULIANA MEDEIROS	Nota Fiscal Produtor Rural	 	006	 	24/11/2014	150,79	 	24/11/2014	150,79	0,00	SDW0344198468441509140857	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	dcd5b0ebf2259bfadf7bc2b291be8ca0b55be42411543f984010b6cd240cc5c4
\N	\N	195.094.288-09	MARCO ANTONIO LANDGRAF	Nota Fiscal Produtor Rural	 	817	 	21/11/2014	188,75	 	21/11/2014	188,75	0,00	SDW0195094288092503100124	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	40c98473da92f8307c6a08e59e2948b4b708ce3c20010ace18d54f5f8c3527cc
\N	\N	195.094.288-09	MARCO ANTONIO LANDGRAF	Nota Fiscal Produtor Rural	 	814	 	21/11/2014	1.427,10	 	21/11/2014	1.427,10	0,00	SDW0195094288092503100124	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	1544b69f7b1ac0cb80ac107146bf14a7a27e451d5e05c9eb1c5122f3d648cc89
\N	\N	009.394.938-37	MANOEL RUIZ GARCIA	Nota Fiscal Produtor Rural	 	0004	 	21/03/2014	323,05	 	21/03/2014	323,05	0,00	SDW0106164408121609091015	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	c456a31c6740a9b377979c4d7254c418b315c01342437507ddc84aed00b013eb
\N	\N	218.085.618-05	SELMA SILVANA BOTTI GADOLFINI	Nota Fiscal Produtor Rural	 	550	 	10/11/2014	386,90	 	10/11/2014	386,90	0,00	INSP024300000003220509	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	89bd92f35ccdef898e77d3f306ae5bb3029724a2187484b3936d0d4f06af0d84
\N	\N	721.891.428-49	JOSE MARTINS	Nota Fiscal Produtor Rural	 	001544	 	13/05/2014	2.302,57	 	13/05/2014	2.302,57	0,00	SDW0721891428491201111131	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	1cb31df0eb258be14f6a8031c950063bff0cdf274b5eb32ae3dd2cdcd732ddc3
\N	\N	127.067.578-84	NILSON APARECIDO GRIPPA	Nota Fiscal Produtor Rural	 	0063	 	09/12/2014	110,21	 	09/12/2014	110,21	0,00	SDW0127067578841405120241	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	1d2d3c3b88c2f3278b5d337c139fcab6ff53c7e94b40e777cd1b0f4cf63df3ba
\N	\N	195.094.288-09	MARCO ANTONIO LANDGRAF	Nota Fiscal Produtor Rural	 	00765	 	11/09/2014	1.740,40	 	11/09/2014	1.740,40	0,00	SDW0195094288092503100124	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	d21980edfc997729c7d4f1be635403141bf2e5ccd916642c8a6f8922e5299044
\N	\N	353.083.028-39	JULIANO OLIVEIRA DA COSTA	Nota Fiscal Produtor Rural	 	01	 	01/12/2014	721,75	 	01/12/2014	721,75	0,00	SDW0353083028392810141146	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	dbfbca08058076c5acedd98375316302bb152260d6f1ed535b8bc6682a69af11
\N	\N	016.928.998-21	TEREZA MARIA DE LIMA MARQUES	Nota Fiscal Produtor Rural	 	0023	 	09/01/2014	612,00	 	09/01/2014	612,00	0,00	IN-SP024300000014-150513	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	88980dff671b2ec43bef4d21fb24113d48792a8cbd0a656901dfaf0a2b8c86bd
\N	\N	742.828.598-49	JOSE BATISTA DOS SANTOS	Nota Fiscal Produtor Rural	 	0011	 	14/11/2014	169,17	 	14/11/2014	169,17	0,00	SDW0742828598490310120441	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	f0e9c6c4ad9c668a88fb7398a36c6e34678e2c2f9844f83e119813ba33c6bc8f
\N	\N	295.896.478-71	ROBSON JOSE CAPPELARO	Nota Fiscal Produtor Rural	 	0035	 	21/05/2014	903,83	 	21/05/2014	903,83	0,00	SDW0295896478712311120121	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	2b3464d84e830a7bf87f8f9e863ca739b8d486b3c2014b91383e2c479dd042ef
\N	\N	394.002.768-50	DAIANE CORDEIRO DE OLIVEIRA	Nota Fiscal Produtor Rural	 	007	 	12/08/2014	1.740,64	 	12/08/2014	1.740,64	0,00	SDW394002768502402121216	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	1b7f5d02780eef7dac4bb3ae38800547806de862376522e454a632d2e471d190
\N	\N	416.458.068-20	ALEX JOSE SANTA ROSA	Nota Fiscal Produtor Rural	 	021	 	24/11/0214	245,18	 	24/11/2014	245,18	0,00	SDW0416458068202409130328	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	dece5a804afe48e7b426ec19e2a57a3b423d93d28800a18681fe4da292b6af99
\N	\N	056.442.228-29	SERGIO APARECIDO MARINO	Nota Fiscal Produtor Rural	 	002	 	10/04/2014	208,17	 	10/04/2014	208,17	0,00	SDW0056442228292809090147	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426	00751a3f97604768f1aecd63e0dc01b51eb085f9ec0549c9d1cb15d380fda824
\N	\N	14.854.572/0001-42	RICARDO VASCONCELOS	Nota Fiscal Produtor Rural	 	014	 	05/07/2013	4.704,64	 	05/07/2013	4.704,64	0,00	 	 	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	f4644afcc01e2ef692e2220c57b0344c523ab5f16dc8beb4858a72df90c6629f
\N	\N	12.804.372/0001-50	JELLYFRUIT - FABRICACAO E DISTRIBUICAO DE PRODUTOS ALIMENTICIOS LTDA	Nota Fiscal Eletrônica	 	1741	 	16/02/2013	31.200,00	 	18/02/2013	31.200,00	0,00	 	 	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	2a24a25f4ded2bd688a2be6eabffd42d46c71ddadcc4028120b4585954ce8f0b
\N	\N	052.248.468-97	MOISES SANTA ROSA	Nota Fiscal Produtor Rural	 	027	 	11/10/2013	1.736,35	 	11/10/2013	1.736,35	0,00	SDW0052248468972505110410	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	85daff915de956303064a961201ea4089068d9236e46a4185897ff6b41110bd1
\N	\N	10.845.863/0001-13	MAURILIO EDUARDO DA SILVA	Nota Fiscal Produtor Rural	 	015	 	05/07/2013	184,55	 	05/07/2013	184,55	0,00	 	 	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	5bb2365e96a3f938620e8f02746e62d79e7b5c21621f2f303e1c29d9beeed562
\N	\N	016.928.998-21	TEREZA MARIA DE LIMA MARQUES	Nota Fiscal Produtor Rural	 	03	 	19/09/2013	297,78	 	19/09/2013	297,78	0,00	INSP024300000014150513	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	44d2c07c6ab4cc0e20629a9889c327755bb98c1c818ce4ce0b011ccf8b68d035
\N	\N	266.536.328-30	LINDAMIRA APARECIDA TEODORO RIBEIRO	Nota Fiscal Produtor Rural	 	07	 	09/10/2013	88,13	 	09/10/2013	88,13	0,00	INSP024300000017220509	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	1e455d3dc0996c1f6bab64be673ae86d274ead577161eee6fda95ba9f41894e6
\N	\N	266.536.328-30	LINDAMIRA APARECIDA TEODORO RIBEIRO	Nota Fiscal Produtor Rural	 	07	 	09/10/2013	1.669,02	 	09/10/2013	1.580,90	0,00	INSP024300000017220509	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	1f3a7944b8f32f8704c1db4ddf684388ce811eed65455b519b4217cd0053539a
\N	\N	08.994.330/0001-51	ANTONIO MANOEL DIAS E OUTRA	Nota Fiscal Produtor Rural	 	037	 	02/08/2013	5.853,48	 	02/08/2013	5.853,48	0,00	 	 	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	a3349699b8e165223e23277bd18097b0d175b4e8421c0d6ffcc50d7920398ddb
\N	\N	11.238.992/0001-06	VALDEMAR PRATAVIEIRA	Nota Fiscal Produtor Rural	 	026	 	01/08/2013	1.913,92	 	01/08/2013	1.913,92	0,00	 	 	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	c4110dad1fdc57390fa658c04f07c676010c0e41d1957b071c0c568ed72f16cf
\N	\N	11.238.992/0001-06	VALDEMAR PRATAVIEIRA	Nota Fiscal Produtor Rural	 	025	 	01/08/2013	248,78	 	01/08/2013	248,78	0,00	 	 	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	fbdc8f8ee5609b1d0d49bbb66db1d271d69f4166f4368094c3f15dcd71b0102e
\N	\N	11.174.198/0001-46	JOSUE LUIZ PEREIRA	Nota Fiscal Produtor Rural	 	0106	 	18/07/2013	2.614,87	 	18/07/2013	2.614,87	0,00	 	 	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	490b3312a9a01b86290f1b6f9f86a2fa12d541a4e4bb26c25089b1eebbdd9d04
\N	\N	10.286.829/0001-56	SO PEIXE ALIMENTOS - COMERCIO DE PRODUTOS ALIMENTICIOS EIRELI	Nota Fiscal Eletrônica	 	13291	 	04/11/2013	3.881,74	 	04/11/2013	3.881,74	0,00	 	 	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	8f3f2db08c5363a65c223e7c63303f35283504731dd53f2a65b25e88ee95b8ad
\N	\N	12.804.372/0001-50	JELLYFRUIT - FABRICACAO E DISTRIBUICAO DE PRODUTOS ALIMENTICIOS LTDA	Nota Fiscal Eletrônica	 	1695	 	30/01/2013	663,12	 	31/01/2013	663,12	0,00	 	 	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	b242172ae233c615ad8fcfd5a17041e291d52c4a625a232e229f0e1406653782
\N	\N	12.804.372/0001-50	JELLYFRUIT - FABRICACAO E DISTRIBUICAO DE PRODUTOS ALIMENTICIOS LTDA	Nota Fiscal Eletrônica	 	2077	 	08/06/2013	25.200,00	 	08/06/2013	25.200,00	0,00	 	 	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	6832e4d1b81868d3b9414d8f2ad1f301a8f05a3a845b3af6d51983c431f64f14
\N	\N	12.804.372/0001-50	JELLYFRUIT - FABRICACAO E DISTRIBUICAO DE PRODUTOS ALIMENTICIOS LTDA	Nota Fiscal Eletrônica	 	2071	 	06/06/2013	15.600,00	 	06/06/2013	15.600,00	0,00	 	 	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	27dd7277808fe523f70ed0cea0dc4fde1a42de15566f24a2585bf197717c39d9
\N	\N	09.367.097/0001-40	JOAO HEBERT CASATTI	Nota Fiscal Produtor Rural	 	0129	 	09/12/2013	1.436,59	 	09/12/2013	1.436,59	0,00	 	 	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	6c0e3f5ff6e5edddc39187235a5b4010b64b85196f57bd5e1f1ed1ba1c877397
\N	\N	12.804.372/0001-50	JELLYFRUIT - FABRICACAO E DISTRIBUICAO DE PRODUTOS ALIMENTICIOS LTDA	Nota Fiscal Eletrônica	 	2072	 	06/06/2013	29.142,00	 	06/06/2013	29.142,00	0,00	 	 	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	29b0822d07dff2800a0918dc245bcba9d6873421f096fa1b25bb1f8c0fa94d59
\N	\N	70.992.359/0003-30	FRIDEL FRIGORIFICO INDUSTRIAL DEL REY LTDA	Nota Fiscal Eletrônica	 	191289	1	22/09/2013	47.846,00	 	22/09/2013	47.846,00	0,00	 	 	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	560f0ea375320c7699eba05cd73503c6c8f9284995c26c03518340e016a301ad
\N	\N	11.238.992/0001-06	VALDEMAR PRATAVIEIRA	Nota Fiscal Produtor Rural	 	028	 	19/09/2013	1.232,00	 	19/09/2013	1.232,00	0,00	SDW0464578108101910110304	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	2c22b57ecedcb976c075b7fa95a500111ffdce40ef56609cae82603bd1b15357
\N	\N	15.500.029/0001-00	EDNEIA APARECIDA MESSA E OUTROS	Nota Fiscal Produtor Rural	 	017	 	10/10/2013	1.278,00	 	10/10/2013	1.278,00	0,00	SDW010662354818120612034	\nDespesa referente à aquisição de produtos da Agricultura Familiar, conforme art. 14 da Lei 11.947/2009	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8	e34d284ae0a60bdd1e80f8a67a8c88123b8594bf1cbca802c67141309b510d78
\.


--
-- TOC entry 2984 (class 0 OID 23575)
-- Dependencies: 195
-- Data for Name: docitems_933d0521; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.docitems_933d0521 ("Descrição", "Unid. de Medida", "Natureza da Despesa", "Qtde.", "Valor Unitário (R$)", "Valor Total (R$)", "Operações", nf_c4ai_id) FROM stdin;
8667/2019ALIMENTAÇÃO ESCOLAR	Monetário	Custeio	 	 	820,63	Alterar	81821941fe4f6bacc4501734f3750e1dd15f8617ffd2ba95e93affaeb2606ff5
8667/2019ALIMENTAÇÃO ESCOLAR	Monetário	Custeio	 	 	13.462,44	Alterar	3d9f488b871f517904056766345c5056273c5d64d5b56069d8aa33532c48ce7d
8737/2019ALIMENTAÇÃO ESCOLAR	Monetário	Custeio	 	 	8.478,65	Alterar	f1f3c9ea20fe77cc507b47112070080fe803089cd22880008a0e4e6d9b9b3811
\.


--
-- TOC entry 2982 (class 0 OID 23555)
-- Dependencies: 193
-- Data for Name: docitems_f0236512; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.docitems_f0236512 ("Código do Produto", "Descrição do Produto / Serviço", "NCM/SH", "O/CST", "CFOP", "Unid. de Medida", "Qtde.", "Valor Unitário (R$)", "Valor Total (R$)", nf_c4ai_id) FROM stdin;
63	CARNE CONGELADA DE BOVINO - PATINHO EM TIRAS	2023000	 	6120	KG	17640	21,55	380.142,00	79a1af38c777fa214c2b47a4c87a538fcdb5a1bf4e796437fc192f8830e771b3
0012	BANANA NANICA CLIMATIZADA	8039000	 	5102	UND	115404	0,35	40.391,40	f5603f8b5c63ae8013234cd4f3b172a7d8b25c9a5a3ac1bd2df208c6da05773e
44	BANANA PRATA ORGANICA	8039000	 	5102	UN	38460	0,43	16.537,80	b9ed576190a8eac23b03fdc1ceb8eb5ed863338e28e76c250a1e0040c4195376
002	BANANA NANICA CLIMATIZADA	8039000	 	5101	UNID.	55716	0,35	19.500,60	4a585d98285ea1bb2f18c41fc26be52a0d246185db14a7374647c62171fb4943
1900401009958	EXTRATO TOMATE SIMPLES 4X2Kg	20029090	 	5101	KG	17472	4,00	69.888,00	0b52aff5e12bcc65eb27993a234add4d9a9c45a9e6f3ffa2f9ce5d0a3cc4d2c7
251	ARROZ LONGO FINO POLIDO T1 ORGANICO - 5 KG COOPAN - ATC = Nao	10063021	 	6107	KG	32100	3,47	111.387,00	01bac19e36b683639a74f63ac9d9d89b9d087f60c4c07039d02db6532382875e
013SP	PAO TIPO HOT DOG 50 GRS.	19052090	 	5101	KG	17036	11,59	197.447,23	049bf205b0846f516dd478c2a7d373b1f48c8898712361f79a0413491fd50bd5
0SP	BOLO TRADICIONAL IND. 40 GRS. SABORES DIVERSOS	19059090	 	5101	KG	8084	13,65	110.346,60	b6ca0784f1afd777616c872e748853358d398df39f7cadc9f74f4a65486a3f62
2092	SAL REFINADO DE MESA IODADO FD 10X1KG SOSAL	25010020	 	5102	KG	10980	1,09	11.968,20	021d1750a8c9e665022dce7c5578c94dd2a10e06e425dd4a6af7a67794aa72e3
002186	LEITE EM PO INTEGRAL 10X1KG NUTRICIONAL SIF 616 PREFEITURA DE SAO PAULO	4022110	 	6107	KG	25000	13,49	337.250,00	fec38c8cb0d648cfa8864af62f72ccb0fc50d9d32a8fee8958067f3f26c752ed
251	ARROZ LONGO FINO POLIDO T1 ORGANICO - 5 KG COOPAN	10063021	 	6107	KG	24990	2,47	61.725,30	ed65747be130d87a792bb3d911807c4591ba43c924738612caf948751386a2a7
G-160	COMPOSTO LACTEO SABOR CAFE PCT 2KG - SIF 0084 (PMSP)	19019090	 	5120	Kg	18816	13,20	248.371,20	9ed382efcad00354f036e75f532b05feaf55bc23dc2fccc11b4cb33d953703ae
000011	ESCAROLA	7052900	 	5102	KG	31	5,17	164,66	e60335f172a6e1aa5e50f1c022e22e7c9453526ccaa542183983839d19da5a86
000272	REPOLHO LISO ORGANICO	7049000	 	5102	KG	408	1,88	767,04	e60335f172a6e1aa5e50f1c022e22e7c9453526ccaa542183983839d19da5a86
2092	SAL REFINADO DE MESA IODADO FD 10X1KG SOSAL	25010020	 	5102	KG	10020	1,09	10.921,80	a3d82a15f8a69008e1a86560d232360e477e2b28561b6e7641a84c9dfb6fc2d8
39	BANANA NANICA CLIMATIZADA	8039000	 	5102	UN	63948	0,35	22.381,80	74d71e7776586620926ff8598dbc6b65fa76a8da4eebffb05517a1cbfdbdcf02
1	BISNAGUINHA TRADICIONAL 20 G KG	19059090	 	5101	Kg	12099	12,00	145.195,20	8e7b4f4843a1692ccca0522c64a456bcd4c45825e974f745a6c3caaaa4dc44eb
1	BISNAGUINHA TRADICIONAL 20 G KG	19059090	 	5101	Kg	572	12,00	6.868,80	f84a63b62ca87a86e2d9ed166e46b80f2fdd9929a90a4b162542ea073207651f
90570	MAC.PARAFUSO SEMOLA S/OVOS PCT 5KG	19021100	 	5101	PCT	2352	13,05	30.693,60	bf9469e47a98810b7a24166f8f9f817c8698cac678324e0959200cb45c1b35ed
0012	BANANA NANICA CLIMATIZADA	8039000	 	5102	UND	33900	0,35	11.865,00	1dfb03a8658aee2d3d05ec279a7f167ae965cac6e9ec12d7647a1ff805f9f6a2
3641	M. DALLAS PARAFUSO INTEGRAL PREFEITURA KG	19021900	 	5101	KG	18000	3,34	60.120,00	9cb7d5e00b815838594ac07deb61831cd1da549898979183686ccf8db400721b
11	Goiaba Vermelha	8045010	 	5102	KG	615	4,37	2.688,86	f3defaedb51531f9df533e6fa10da174344bfdf059c8e4b4fa624639f394a678
11	Goiaba Processada	8045010	 	5102	KG	802	2,56	2.053,89	f3defaedb51531f9df533e6fa10da174344bfdf059c8e4b4fa624639f394a678
35	Abacate	8044000	 	5102	KG	625	2,94	1.838,68	f3defaedb51531f9df533e6fa10da174344bfdf059c8e4b4fa624639f394a678
31	Limao	8055000	 	5102	KG	150	3,12	468,31	f3defaedb51531f9df533e6fa10da174344bfdf059c8e4b4fa624639f394a678
20	Abobrinha	7099300	 	5102	KG	258	2,11	545,01	f3defaedb51531f9df533e6fa10da174344bfdf059c8e4b4fa624639f394a678
159	COXA/SOBRECOXA SEM OSSO SEM PELE	2071400	 	5102	KG	1416	11,41	16.156,56	175efa38f7c5b9c484daff51932f732f2762e1dbd69480b140e71731e03b8677
159	COXA/SOBRECOXA SEM OSSO SEM PELE	2071400	 	5102	KG	488	11,41	5.568,08	7d3dc389a58a187790951ba77733ea21796e9fa2f87b838c7b99d05d98c80142
26	CEBOLA	7122000	 	5102	KG	222	2,72	603,84	ae84191494aa4b40d7bf050d9845098478d12d98198cf600d25081a7ac7b503c
29	BANANA NANICA	8031000	 	5102	KG	2571	2,44	6.274,46	ae84191494aa4b40d7bf050d9845098478d12d98198cf600d25081a7ac7b503c
25	BATATA	7101000	 	5102	KG	500	2,53	1.265,00	ae84191494aa4b40d7bf050d9845098478d12d98198cf600d25081a7ac7b503c
159	COXA/SOBRECOXA SEM OSSO SEM PELE	2071400	 	5102	KG	246	11,41	2.806,86	8f1601dbece2bc47f5a6587b046ff21180a6777bbaa3ec99b32e757dd0008760
12	Cenoura	7061000	 	5102	KG	315	1,94	611,10	60c46e02b0a97350336701936f07711f23614d5c88f57c4495ddaa8928f2f2ee
07	Beterraba	7069000	 	5102	KG	50	1,64	82,49	60c46e02b0a97350336701936f07711f23614d5c88f57c4495ddaa8928f2f2ee
26	Batata doce	7019000	 	5102	KG	80	2,01	161,60	60c46e02b0a97350336701936f07711f23614d5c88f57c4495ddaa8928f2f2ee
05	Beringela	7093000	 	5102	KG	663	2,32	1.539,55	60c46e02b0a97350336701936f07711f23614d5c88f57c4495ddaa8928f2f2ee
03	Repolho	7049000	 	5102	KG	337	1,11	374,18	60c46e02b0a97350336701936f07711f23614d5c88f57c4495ddaa8928f2f2ee
24	Tomate	7020000	 	5102	KG	208	2,99	623,71	60c46e02b0a97350336701936f07711f23614d5c88f57c4495ddaa8928f2f2ee
23	Pepino	7070000	 	5102	KG	217	1,99	433,02	60c46e02b0a97350336701936f07711f23614d5c88f57c4495ddaa8928f2f2ee
09	Abobora	7099300	 	5102	KG	468	1,78	833,93	60c46e02b0a97350336701936f07711f23614d5c88f57c4495ddaa8928f2f2ee
21	Maracuja	8109015	 	5102	KG	2247	4,30	9.662,10	60c46e02b0a97350336701936f07711f23614d5c88f57c4495ddaa8928f2f2ee
191	FRANGO-FILEZINHO-SASSAMI	2071400	 	5102	KG	872	11,40	9.940,80	0820e5ad97bc0822524c238056d790fff26060a2b07fa681bec70f6e8519b3e6
29	BANANA NANICA	8031000	 	5102	KG	2643	2,44	6.450,38	ae6287feb2fd450aade17d2703efcb34ab1f5415ad0e6722c447291ff2d7ed53
25	BATATA	7101000	 	5102	KG	900	2,53	2.278,77	ae6287feb2fd450aade17d2703efcb34ab1f5415ad0e6722c447291ff2d7ed53
26	CEBOLA	7122000	 	5102	KG	278	2,72	757,52	ae6287feb2fd450aade17d2703efcb34ab1f5415ad0e6722c447291ff2d7ed53
12	Cenoura	7061000	 	5102	KG	625	2,37	1.481,25	8ace5432a748b638d9ce5df3c043eab34c036038d3eb6181c06ef501408a5279
20	Abobrinha	7099300	 	5102	KG	345	2,37	818,84	8ace5432a748b638d9ce5df3c043eab34c036038d3eb6181c06ef501408a5279
39	Pessego	8093010	 	5102	KG	29	6,51	190,74	8ace5432a748b638d9ce5df3c043eab34c036038d3eb6181c06ef501408a5279
26	Batata	7019000	 	5102	KG	690	2,53	1.746,21	8ace5432a748b638d9ce5df3c043eab34c036038d3eb6181c06ef501408a5279
02	Alface	7051100	 	5102	KG	379	2,92	1.108,14	8ace5432a748b638d9ce5df3c043eab34c036038d3eb6181c06ef501408a5279
03	Repolho	7049000	 	5102	KG	224	1,43	320,32	8ace5432a748b638d9ce5df3c043eab34c036038d3eb6181c06ef501408a5279
11	Goiaba proces.	8045010	 	5102	KG	300	2,79	837,00	8ace5432a748b638d9ce5df3c043eab34c036038d3eb6181c06ef501408a5279
160	FRANGO-COXA/SOBRECOXA SEM OSSO SEM PELE	2071400	 	5102	KG	1120	11,41	12.779,20	5135b56d91d7bb2f7a39c448d9f681a167dbe8c83c1ddccf931adeae9f7dbf52
33	Manga	8045020	 	5102	KG	2000	3,45	6.900,00	dd20136b16be79b73ca70b20f4b13e84d173e94805d5e0483406e3326f5428ec
11	Goiaba Processada	8045010	 	5102	KG	614	2,56	1.573,63	dd20136b16be79b73ca70b20f4b13e84d173e94805d5e0483406e3326f5428ec
35	Abacate	8044000	 	5102	KG	587	2,94	1.726,66	dd20136b16be79b73ca70b20f4b13e84d173e94805d5e0483406e3326f5428ec
02	Alface	7051100	 	5102	KG	107	2,43	261,47	dd20136b16be79b73ca70b20f4b13e84d173e94805d5e0483406e3326f5428ec
31	Limao	8055000	 	5102	KG	308	3,12	963,46	dd20136b16be79b73ca70b20f4b13e84d173e94805d5e0483406e3326f5428ec
21	Maracuja	8109015	 	5102	KG	168	4,30	724,98	dd20136b16be79b73ca70b20f4b13e84d173e94805d5e0483406e3326f5428ec
20	Abobrinha	7099300	 	5102	KG	309	2,11	653,05	dd20136b16be79b73ca70b20f4b13e84d173e94805d5e0483406e3326f5428ec
05	Beringela	7093000	 	5102	KG	208	2,32	483,95	dd20136b16be79b73ca70b20f4b13e84d173e94805d5e0483406e3326f5428ec
09	Abobora	7099300	 	5102	KG	400	1,78	712,89	dd20136b16be79b73ca70b20f4b13e84d173e94805d5e0483406e3326f5428ec
12225	BOLINHO SIMPLES INDIVIDUAL	19059090	 	5405	KG	924	17,56	16.239,49	9795f754011a89cb6efe7c5c0d466c892e62e157aa7466ec9aded156da9447ab
12180	PAO ITPO BISNAGUINHA INTEGRAL 20G	19059090	 	5405	UN	7950	0,25	1.987,50	9795f754011a89cb6efe7c5c0d466c892e62e157aa7466ec9aded156da9447ab
12182	PAO TIPO HOT DOG INTEGRAL 50G	19059090	 	5405	UN	2020	0,56	1.131,20	9795f754011a89cb6efe7c5c0d466c892e62e157aa7466ec9aded156da9447ab
97	Alho	7129010	 	5102	kg	230	16,30	3.749,00	a670b75fae2570b61a06d5f1fdbc85a1d53e91d1a4d6cc9c303b3c4ec37956c7
01	Acelga	7049000	 	5102	KG	440	1,46	642,40	b2c9e53cb618353a1b13e2e32903c52944936eb19d86520c695155fb0fa82452
25	Abacaxi Perola	8043000	 	5102	KG	2570	3,24	8.327,77	b2c9e53cb618353a1b13e2e32903c52944936eb19d86520c695155fb0fa82452
16	Brocolis	7041000	 	5102	KG	1112	4,51	5.017,38	b2c9e53cb618353a1b13e2e32903c52944936eb19d86520c695155fb0fa82452
14	Couve Flor	7049000	 	5102	KG	284	4,33	1.231,02	b2c9e53cb618353a1b13e2e32903c52944936eb19d86520c695155fb0fa82452
05	Beringela	7093000	 	5102	KG	289	2,54	735,58	b2c9e53cb618353a1b13e2e32903c52944936eb19d86520c695155fb0fa82452
24	Tomate	7020000	 	5102	KG	665	3,72	2.474,54	b2c9e53cb618353a1b13e2e32903c52944936eb19d86520c695155fb0fa82452
08	Laranja	8051000	 	5102	KG	1169	1,98	2.315,02	b2c9e53cb618353a1b13e2e32903c52944936eb19d86520c695155fb0fa82452
10	Banana Nanica	8039000	 	5102	KG	1485	2,44	3.623,40	b2c9e53cb618353a1b13e2e32903c52944936eb19d86520c695155fb0fa82452
14	Couve	7049000	 	5102	KG	81	5,11	415,44	b2c9e53cb618353a1b13e2e32903c52944936eb19d86520c695155fb0fa82452
197	COXA/SOBRECOXA SEM OSSO SEM PELE	2071400	 	5102	KG	600	11,41	6.846,00	2582e11e4851419ca9a0d93c19ea6ceb347fa074a4d0176cc4b3f6275506ca3c
3187	FARINHA DE MILHO	11041900	 	5102	KLG	150	2,40	360,00	fc4d58c5267f2ae12dc5f0bfd8ed0b3ef887c45988177d60e177f08ae64f4d67
3077	SAL IODADO	25010020	 	5102	KLG	190	0,85	161,50	fc4d58c5267f2ae12dc5f0bfd8ed0b3ef887c45988177d60e177f08ae64f4d67
3271	VINAGRE DE MACA 750ML	22090000	 	5102	FRC	156	2,82	439,92	fc4d58c5267f2ae12dc5f0bfd8ed0b3ef887c45988177d60e177f08ae64f4d67
97	Alho	7129010	 	5102	kg	200	16,30	3.260,00	a3415e5f31572462b07a6b00309fc26b12c7f046a37578d5ba0c74413c78b3fb
5601	FUBA	11022000	 	5102	KLG	300	1,25	375,00	dfaab951664a4d51bafca170fe427a5df347e0bbf4f8233d4dd6b1c2a63b7bd0
6631	MILHO VERDE EM CONSERVA	20058000	 	5405	KLG	48	5,87	281,76	dfaab951664a4d51bafca170fe427a5df347e0bbf4f8233d4dd6b1c2a63b7bd0
3271	VINAGRE DE MACA 750ML	22090000	 	5102	FRC	40	2,82	112,80	dfaab951664a4d51bafca170fe427a5df347e0bbf4f8233d4dd6b1c2a63b7bd0
158	COXA/SOBRECOXA SEM OSSO SEM PELE	2071400	 	5102	KG	771	9,20	7.093,20	5af6e6a9e16746465381c642fa10fecfcbddeddcfa2e77ae6af49d9d73ea350d
140	FRANGO-FILEZINHO-SASSAMI	2071400	 	5102	KG	490	10,50	5.145,00	04d7983c1be9ff5f754510da25b5a058a6eaa03df2fb3c1db7da9f76457c3b8a
363	PATINHO CUBOS DE 2 KG (1)	2013000	 	5102	KG	642	15,94	10.233,48	402db242fdd25a7b3ce2db51525e1b6780d72b07b88373e0acdcf0d38042ac4f
533	PATINHO EM TIRAS PT 2KG (1)	2023000	 	5102	KG	736	15,94	11.731,84	402db242fdd25a7b3ce2db51525e1b6780d72b07b88373e0acdcf0d38042ac4f
20003	SEMOLA C/OVOS TIPO ANEL MEDIO PCT 500G	19021100	 	5101	PCT	20	1,25	25,10	32bc155f7a4673363306c203bb2fabc5908eb9f4cdd2008a2293cf02f5c611fd
20009	SEMOLA C/OVOS TIPO ESPIRAL PCT 500G	19021100	 	5101	PCT	1000	1,25	1.255,00	32bc155f7a4673363306c203bb2fabc5908eb9f4cdd2008a2293cf02f5c611fd
20015	SEMOLA C/OVOS TIPO PENA PCT 500G	19021100	 	5101	PCT	1000	1,25	1.255,00	32bc155f7a4673363306c203bb2fabc5908eb9f4cdd2008a2293cf02f5c611fd
11742	PAO DE FORMA FATIADO	19059090	 	5405	KG	255	6,97	1.777,35	fdf38e4423d1f4b1837b765169eb73e90080a74e658d5730b427404b3044ec86
11741	PAO DE FORMA INTEGRAL FATIADO	19059090	 	5405	KG	505	12,84	6.484,20	fdf38e4423d1f4b1837b765169eb73e90080a74e658d5730b427404b3044ec86
6632	ERVILHA EM CONSERVA	20054000	 	5405	KLG	76	5,69	436,99	c98bf7c534b55eda4df0269d903a84637c737e156aaf74a6dfc302f587bd4151
6631	MILHO VERDE EM CONSERVA	20058000	 	5405	KLG	96	5,87	563,52	c98bf7c534b55eda4df0269d903a84637c737e156aaf74a6dfc302f587bd4151
5901	LEITE LONGA VIDA INTEGRAL	4012010	 	5405	LTR	12960	2,66	34.473,60	41f480b5edd7e6885444692a49ebe66fece1dc58171060b79a6a0fbf678bacd4
3860	PAO TIPO HOT DOG 50G	19059090	 	5405	UN	8040	0,47	3.778,80	4cdbe2f1a1ef20454f01734dd79d30ae82064de3153425105d838fb714c2f1e4
5901	LEITE LONGA VIDA INTEGRAL 01LT	4012010	 	5405	LTR	2580	2,66	6.862,80	a3f81d726fb7c6c0c783ab8e91427421846575b18e6ba96ff275cdb8d1ee18df
11742	PAO DE FORMA FATIADO	19059090	 	5405	KG	795	6,97	5.541,15	fc0161a4a35a64336fe42ae30d24e9a386352a33229dc63531abc251a4f2b50f
5901	LEITE LONGA VIDA INTEGRAL 01LT	4012010	 	5405	LTR	2572	2,66	6.841,52	2f80073150017214fae5a300add38285302e9be4d3248f395ce307e77f0af598
 	85/2015ALIMENTAÇÃO ESCOLAR	 	 	 	Monetário	 	 	1.185,30	04acb3d09ea6b10a7626a44160f8d3d3ff8b7b298cce9ad141ec45b6c7e052ef
 	6215/2014ALIMENTAÇÃO ESCOLAR	 	 	 	Monetário	 	 	6.127,92	9ba58424c1287c71e20804b3daf359a1e4e0d52affbc672624fc3c3c0b5e92d2
\.


--
-- TOC entry 2985 (class 0 OID 23586)
-- Dependencies: 196
-- Data for Name: docitems_f1ecd601; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.docitems_f1ecd601 ("Grupo", "Item", "Unidade", "Quantidade", "Valor Unitário (R$)", "Valor Total (R$)", "Operações", nf_c4ai_id) FROM stdin;
Hortaliças e derivados	Mandioca	KG	404,200	1,72	695,22	Alterar	d81830467753137ff301862cf1526b9c7afa1a0e5b165f8ae925c6a148c39316
Hortaliças e derivados	Manjericão	KG	20,400	27,72	565,49	Alterar	d81830467753137ff301862cf1526b9c7afa1a0e5b165f8ae925c6a148c39316
Frutas e derivados	Goiaba	KG	998,500	2,79	2.785,81	Alterar	874d336e82da84e273ed4a9d2a80b4bde054ba57b0251600abe859f9e09292dc
Hortaliças e derivados	Cheiro verde	KG	75,000	8,78	658,50	Alterar	e00ae9311a0804bf9e9b1ef0d608a48695217411df3981c35c2870a7e54f57a2
Hortaliças e derivados	Tomate salada	KG	163,000	10,76	1.753,88	Alterar	e00ae9311a0804bf9e9b1ef0d608a48695217411df3981c35c2870a7e54f57a2
Frutas e derivados	Banana	KG	700,000	2,14	1.498,00	Alterar	7ca0edffdffa21aea1cf9cbfcdea543ba9d2bed21c8d71193b1107bac73c686b
Frutas e derivados	Laranja	KG	2.404,800	1,80	4.328,64	Alterar	f44573ba27e29f57a1156c0a3acb5a9d90e7cae4691aaebcf1db045f1fb28a41
Frutas e derivados	Mexerica ponkan/bergamota/tangerina	KG	513,900	3,02	1.551,98	Alterar	f44573ba27e29f57a1156c0a3acb5a9d90e7cae4691aaebcf1db045f1fb28a41
Frutas e derivados	Abacaxi	KG	1.474,000	2,83	4.171,42	Alterar	551bfd60a6b608ec3f91d24bb33ab5bd04bcb1f6a4a4f89f6d74404e1a95995b
Frutas e derivados	Mamão	KG	1.474,000	2,69	3.965,06	Alterar	551bfd60a6b608ec3f91d24bb33ab5bd04bcb1f6a4a4f89f6d74404e1a95995b
Hortaliças e derivados	Chuchu	KG	297,900	1,92	571,97	Alterar	2d998f920396e1238cf65f202803e5f242a866bff81d02e3c67ea66551ae1237
Frutas e derivados	Goiaba	KG	920,900	2,56	2.357,50	Alterar	8da9fa29bf84765830600d12e7df4c8f7c53982943b861aa11bebecbe3fe6e18
Carnes e derivados	Frango, coxa da asa, resfriado/congelado	KG	722,000	9,20	6.642,40	Alterar	8f2234e594237d7db0ad7ce2a2dedb7e39b3699c84fbb529a7803975e52e40ae
Hortaliças e derivados	Cheiro verde	KG	43,200	6,37	275,18	Alterar	b62d5aa784e33618b72e5ade7fcaf5de16ba5660295139a6f92a0fe0836cf6e4
Frutas e derivados	Manga	KG	884,000	3,50	3.094,00	Alterar	e60d2e12a6e71704049b8773d8b2b4c85b6ab40d8d637e99924363031d0a9fd9
Frutas e derivados	Maracujá	KG	939,000	6,42	6.028,38	Alterar	e60d2e12a6e71704049b8773d8b2b4c85b6ab40d8d637e99924363031d0a9fd9
Carnes e derivados	Salsicha, diversos sabores	KG	336,000	7,76	2.607,36	Alterar	469290cca45c6f3ee5310d243f783b58ed56b1d9ac241d7c04f440839dce7586
Frutas e derivados	Manga	KG	2.536,000	3,64	9.231,04	Alterar	586e06b49158a0a25d2719a99ea659bf77c4334c9b7a9647b0f831cf02799124
Hortaliças e derivados	Tomate cereja	KG	350,700	7,15	2.507,51	Alterar	586e06b49158a0a25d2719a99ea659bf77c4334c9b7a9647b0f831cf02799124
Frutas e derivados	Maracujá	KG	111,900	4,39	491,24	Alterar	414c368dbb9bbc2e7af4a021724fdbd50fee19d8d89c964a24298577addce60e
Hortaliças e derivados	Alface	KG	13,400	2,69	36,05	Alterar	414c368dbb9bbc2e7af4a021724fdbd50fee19d8d89c964a24298577addce60e
Hortaliças e derivados	Chicória	KG	81,800	3,24	265,03	Alterar	414c368dbb9bbc2e7af4a021724fdbd50fee19d8d89c964a24298577addce60e
Frutas e derivados	Manga	KG	1.822,700	3,50	6.379,45	Alterar	38cc60d56dfb569ec4e04a689e4fe91ab39b61ea713b18934702ba6830eb0b3d
Carnes e derivados	Linguiça, diversos sabores	KG	400,000	11,73	4.692,00	Alterar	76e011e40e4deba5ebd649887f18b55e818ef82c912cc5b2e68af4991e7f1a42
Hortaliças e derivados	Couve-flor	KG	411,500	4,46	1.835,29	Alterar	341a7d1c7648e9307e8462598e07b0b8ffa8d90b81c72b6b4db8af27172ff131
Carnes e derivados	Frango, coxa e sobrecoxa, resfriado/congelado	KG	2.003,000	9,20	18.427,60	Alterar	410b1cecea8c790a1ed6f75143a266e8977e768ee87e23874b034311c7c4c669
Frutas e derivados	Banana	KG	2.513,700	2,47	6.208,84	Alterar	891deeebb7db59254d816da8971e4b9a0c7396837338d850b769755ea99ede4f
Preparações prontas	Frango, pré-preapado, diversos cortes	KG	822,000	10,50	8.631,00	Alterar	d1a64c8a09837a99d5aee056484f380848f7c0f4a617655475657efb9cc95458
Frutas e derivados	Maracujá	KG	540,600	6,42	3.470,65	Alterar	5b720c5ae5d3f3b71158aabeded415402a4ed3df7a3e523f5d365d8046e9cd8c
Carnes e derivados	Frango, sobrecoxa, resfriado/congelado	KG	1.005,000	9,20	9.246,00	Alterar	3e24c9e6a11b106acdbf49374520cd5cf772e0c3e5424277567a1742ff565cb3
Frutas e derivados	Goiaba	KG	656,900	4,58	3.008,60	Alterar	8bd3f4d7cdd84df209dc711bb0601605c15f8bf48a1108738ad5dd6ed6cd517c
Frutas e derivados	Laranja	KG	1.972,000	1,58	3.115,76	Alterar	6ca9a3efe0337353dad73fd654b50ee430b729597bf1c83227776853f36987ff
Hortaliças e derivados	Abóbora	KG	721,800	2,44	1.761,19	Alterar	6ca9a3efe0337353dad73fd654b50ee430b729597bf1c83227776853f36987ff
Carnes e derivados	Frango, coxa e sobrecoxa, resfriado/congelado	KG	316,000	9,20	2.907,20	Alterar	cc81c10e54a3d89e8f78f48cb4e8aa10fccc025dabce5f2f00f0fbe7009498d2
Hortaliças e derivados	Cheiro verde	KG	75,700	6,37	482,21	Alterar	2386f8591ae62c6675aaedd34e0004f45df7810618fba90cf385dc8c3bc8e35f
Frutas e derivados	Goiaba	KG	1.055,000	4,58	4.831,90	Alterar	56e874fb198e85d8726832e207833952571b252a54e46af975ba9b73a6410c6a
Hortaliças e derivados	Pepino	KG	463,400	2,15	996,31	Alterar	5b7178478f8560dcf91f447b48124d8b91674ea87886d2dce884776b533d9ff0
Carnes e derivados	Carne bovina de 1ª, resfriada/congelada	KG	1.532,000	18,50	28.342,00	Alterar	5be063964a14031b5fded9627d0e2b1bf9c3d17f5f169d140a29934809e1a46a
Hortaliças e derivados	Couve-flor	KG	125,000	4,34	542,50	Alterar	953a4a95615556983b3a082b3483e2891244ea498b730f30e17392653b388abd
Preparações prontas	Frango, pré-preapado, diversos cortes	KG	672,000	12,89	8.662,08	Alterar	81c60b22caf77f2f385a07e5bd679adc96f4e1b4ba349e89c4173ef78a7afc56
Hortaliças e derivados	Alho com casca	KG	80,000	9,93	794,40	Alterar	f88db015e0831c9b9340ce276bec5a2d04c8c166601d132850dfa2774d8521f5
Hortaliças e derivados	Cebola	KG	370,000	2,52	932,40	Alterar	f88db015e0831c9b9340ce276bec5a2d04c8c166601d132850dfa2774d8521f5
Hortaliças e derivados	Alface	KG	370,300	3,51	1.299,75	Alterar	1c31ff1b35fd5ec0ee0fca7ff8af6b10003c9e6e0583f0da92748efaff3664f0
Hortaliças e derivados	Cenoura	KG	926,400	3,22	2.983,01	Alterar	1c31ff1b35fd5ec0ee0fca7ff8af6b10003c9e6e0583f0da92748efaff3664f0
Hortaliças e derivados	Cheiro verde	KG	301,500	5,61	1.691,42	Alterar	1c31ff1b35fd5ec0ee0fca7ff8af6b10003c9e6e0583f0da92748efaff3664f0
Hortaliças e derivados	Chicória	KG	230,000	4,61	1.060,30	Alterar	1c31ff1b35fd5ec0ee0fca7ff8af6b10003c9e6e0583f0da92748efaff3664f0
Hortaliças e derivados	Mandioca	KG	714,100	1,24	885,48	Alterar	1c31ff1b35fd5ec0ee0fca7ff8af6b10003c9e6e0583f0da92748efaff3664f0
Hortaliças e derivados	Rúcula	KG	180,000	5,69	1.024,20	Alterar	1c31ff1b35fd5ec0ee0fca7ff8af6b10003c9e6e0583f0da92748efaff3664f0
Carnes e derivados	Carne bovina de 1ª, resfriada/congelada	KG	500,000	18,50	9.250,00	Alterar	aa0b0d669be6319417f20b01ae5fc07aba12c917c5f2340d451dfe0a134e8871
Preparações prontas	Carne bovina, pré-preapada, diversos cortes	KG	780,000	18,50	14.430,00	Alterar	aa0b0d669be6319417f20b01ae5fc07aba12c917c5f2340d451dfe0a134e8871
Hortaliças e derivados	Brócolis	KG	230,000	4,19	963,70	Alterar	7841b2dcb76959d964c08fd84dbc9612dfabdfdf54274472344740afae00c73b
Hortaliças e derivados	Couve-flor	KG	105,000	4,34	455,70	Alterar	7841b2dcb76959d964c08fd84dbc9612dfabdfdf54274472344740afae00c73b
Hortaliças e derivados	Alface	KG	58,200	2,24	130,37	Alterar	97eec5d812143362b3559f02a114f91af16976b526fab9a5e3989096d89e6411
Hortaliças e derivados	Cheiro verde	KG	69,700	5,16	359,65	Alterar	97eec5d812143362b3559f02a114f91af16976b526fab9a5e3989096d89e6411
Hortaliças e derivados	Chicória	KG	20,400	3,14	64,06	Alterar	97eec5d812143362b3559f02a114f91af16976b526fab9a5e3989096d89e6411
Hortaliças e derivados	Couve chinesa	KG	54,600	4,30	234,78	Alterar	97eec5d812143362b3559f02a114f91af16976b526fab9a5e3989096d89e6411
Cereais e derivados	Macarrão de trigo, com ou sem ovos, fresco/seco	KG	150,000	3,79	568,50	Alterar	4e33b9179db3c95b120efeb7097804970b36aebc6739508e2e5f2eb695e7fd09
Hortaliças e derivados	Beterraba	KG	1.000,000	1,74	1.740,00	Alterar	7d17812f39bfa78fbb53f8fa3d86d02d86e5c7af634c5eec478f75fe078b7bcf
Frutas e derivados	Laranja	KG	1.581,000	1,52	2.403,12	Alterar	dc7739cd4939bbaef369287119633f85a34296c0358bf3e679ce9e1363ca1203
Hortaliças e derivados	Vagem	KG	485,700	6,55	3.181,34	Alterar	dc7739cd4939bbaef369287119633f85a34296c0358bf3e679ce9e1363ca1203
Frutas e derivados	Abacaxi	KG	518,800	3,47	1.800,23	Alterar	8f5dc7fd69ce2d6e648ec940bceea7e3d3d8f67737c684a0a1f46009cd5dea98
Hortaliças e derivados	Mandioca	KG	339,300	1,56	529,31	Alterar	8f5dc7fd69ce2d6e648ec940bceea7e3d3d8f67737c684a0a1f46009cd5dea98
Hortaliças e derivados	Abóbora	KG	1.500,000	2,20	3.300,00	Alterar	7295fe05de95822c0e2f02af87ebfd37f5ca436a03ba76facfeed2706aee1028
Hortaliças e derivados	Abobrinha	KG	550,000	2,39	1.314,50	Alterar	7295fe05de95822c0e2f02af87ebfd37f5ca436a03ba76facfeed2706aee1028
Hortaliças e derivados	Berinjela	KG	108,900	3,16	344,12	Alterar	7295fe05de95822c0e2f02af87ebfd37f5ca436a03ba76facfeed2706aee1028
Hortaliças e derivados	Couve-flor	KG	125,000	4,34	542,50	Alterar	7295fe05de95822c0e2f02af87ebfd37f5ca436a03ba76facfeed2706aee1028
Cereais e derivados	Biscoito salgado	KG	740,000	5,61	4.151,40	Alterar	5262ce98b202935761698890c126dee30574a27eea070f6645b8a6318a913878
Hortaliças e derivados	Chuchu	KG	444,000	1,00	444,00	Alterar	e525aa8ee692b3b349cf9ea9efc8c8eacef44ed109bc6c8557985d9c5dacc7a5
Leites e derivados	Leite de vaca integral, UHT	LITRO	25.920,000	2,58	66.873,60	Alterar	03bd7dd4076aeda3bea55e0e038c209faac945d8839439b3ba65457073cc26ec
Frutas e derivados	Maracujá	KG	2.656,500	6,42	17.054,73	Alterar	d568df29223a5ff959ff83cfac89a4902f4fbfac3d335563e68ddff039f8c167
Hortaliças e derivados	Cenoura	KG	757,400	2,79	2.113,15	Alterar	d568df29223a5ff959ff83cfac89a4902f4fbfac3d335563e68ddff039f8c167
Hortaliças e derivados	Alface	KG	95,200	2,24	213,25	Alterar	3f775945df2d4f65e7661c5c1220a24f2b5eb070d8f9dccf72b6d02c940b1d99
Preparações prontas	Carne bovina, pré-preapada, diversos cortes	KG	760,000	12,33	9.370,80	Alterar	a3b7142c5b2d65ab948ae02cd74bc521079f6edc7aab0a87c162019ce6e833ed
Carnes e derivados	Frango, coxa e sobrecoxa, resfriado/congelado	KG	1.538,000	12,33	18.963,54	Alterar	8a5cceadeeb7820ab460652ec9d85caf3610e27fef3b2fbe9efa53dc1b62dbfd
Carnes e derivados	Salsicha, diversos sabores	KG	840,000	8,29	6.963,60	Alterar	e7dae92fcb0d433b6e76f5adde023a520aecf9f96e6bc20e246afa028523b529
Carnes e derivados	Frango, coxa e sobrecoxa, resfriado/congelado	KG	374,000	12,33	4.611,42	Alterar	cc63a01769607aaa9d05fd9f1f8d60ba34528928e2988038b8df3eefc9649ebe
Hortaliças e derivados	Tomate salada	KG	953,200	3,84	3.660,29	Alterar	3b3a332ce1e36ddabe1cc4c07921702a44d0eb579a82a67dea3845ba887e11e9
Hortaliças e derivados	Cenoura	KG	24,500	1,58	38,71	Alterar	08e7b6871b842bd138720e5e2641194b2e065a6c13962b8ab909ad53740d1038
Frutas e derivados	Goiaba	KG	400,000	4,66	1.864,00	Alterar	007caa3771c3944fa68ed0b863a7573f83388da6c56a664f9ddb9e5c1988b2ff
Hortaliças e derivados	Cheiro verde	KG	81,000	5,16	417,96	Alterar	29d06f9dfcefb9cb567bc403f2184cb013afbc777c5856788dd42e8de49f4496
Hortaliças e derivados	Abóbora	KG	501,100	1,42	711,56	Alterar	539269d9680c84df3540bb71b6d9f1725a924b312fd4953e3a317af96ddc43f2
Frutas e derivados	Goiaba	KG	723,700	1,58	1.143,45	Alterar	5eaeccad54fe0f5ed18eab031b9ecee195323232cfef871ee5736b4203c29140
Hortaliças e derivados	Alface	KG	180,000	2,60	468,00	Alterar	81cbe9ab30b05c9650cfdde2a9f760528f3500a00455f955993ab8f5e4f86770
Hortaliças e derivados	Vagem	KG	559,390	3,94	2.204,00	Alterar	4eb44bb26161062200684c4b52f15ff83985acd83aa27f11e932a4eca4b41774
Hortaliças e derivados	Acelga	KG	604,300	1,84	1.111,91	Alterar	ba86a407f85735cd7ef7114979cc16549794b12a01c411aa074a31ff9cbddb4c
Frutas e derivados	Abacaxi	KG	1.746,000	3,47	6.058,62	Alterar	4396146a04695dd8d677ce69fe8ba0a5559b3cc11f92d713754328805227dacc
Frutas e derivados	Banana	KG	3.638,000	1,57	5.711,66	Alterar	160a555a08da06d2daa64c1c5ac1d94b2d925f7155ba4de88ef002d4824882d8
Frutas e derivados	Abacaxi	KG	1.685,000	2,35	3.959,75	Alterar	467a8c81de0f7168bbfb0de7cc779b08cb99c09c40309c88c2a71907320a84bd
Hortaliças e derivados	Tomate salada	KG	119,400	3,84	458,50	Alterar	6260f8a107f3e273c7bf0879c128dc6f01e01851027ca94680f2d083690462d2
Preparações prontas	Frango, pré-preapado, diversos cortes	KG	368,000	12,89	4.743,52	Alterar	dbe652032e0b2275453a8388894aa2f8c4370cac794c7b9106e837598c2eb847
Carnes e derivados	Salsicha, diversos sabores	KG	297,000	8,29	2.462,13	Alterar	787e5e1d5154f16e6e453a15300201227eeb87f4ceee7a42d7d0c79de289c821
Hortaliças e derivados	Alface	KG	135,000	3,38	456,30	Alterar	e764105e60aeb770124c871a31c16f0ce8e0bb10ce6dd3fdc2fb9e6856f3bb15
Hortaliças e derivados	Alface	KG	100,000	2,84	284,00	Alterar	fbdcbef9a9ac29b266c15fb83f034ba2af1f7bc3ccea9e3ee205b4e70f2e785e
Hortaliças e derivados	Couve manteiga	KG	83,700	4,32	361,58	Alterar	fbdcbef9a9ac29b266c15fb83f034ba2af1f7bc3ccea9e3ee205b4e70f2e785e
Carnes e derivados	Carne bovina de 2ª, resfriada/congelada	KG	500,000	15,74	7.870,00	Alterar	9af73a2ae817ef11803d26288134a6c934b75d83eb005541e9a14b9c16427401
Preparações prontas	Carne bovina, pré-preapada, diversos cortes	KG	1.104,000	17,50	19.320,00	Alterar	9af73a2ae817ef11803d26288134a6c934b75d83eb005541e9a14b9c16427401
Preparações prontas	Carne bovina, pré-preapada, diversos cortes	KG	1.078,000	17,50	18.865,00	Alterar	9af73a2ae817ef11803d26288134a6c934b75d83eb005541e9a14b9c16427401
Frutas e derivados	Maracujá	KG	180,000	5,07	912,60	Alterar	989ffb50a215fc580a22832caa5e984a28bf08e547c7cce6a70cf6fbf043bf54
Hortaliças e derivados	Abóbora	KG	291,100	1,58	459,94	Alterar	989ffb50a215fc580a22832caa5e984a28bf08e547c7cce6a70cf6fbf043bf54
Frutas e derivados	Banana	KG	1.197,000	1,43	1.711,71	Alterar	89657d8914e0ab0e5c520fc528504e1950e9ba91fe9df9134e029843dd54dc81
Hortaliças e derivados	Tomate salada	KG	319,000	3,44	1.097,36	Alterar	7af814fe8b597b600664a451d11a9c5481af15e4fca285b68338353bc9a74f1c
Hortaliças e derivados	Vagem	KG	30,900	4,88	150,79	Alterar	dcd5b0ebf2259bfadf7bc2b291be8ca0b55be42411543f984010b6cd240cc5c4
Hortaliças e derivados	Beterraba	KG	1,000	1,28	1,28	Alterar	40c98473da92f8307c6a08e59e2948b4b708ce3c20010ace18d54f5f8c3527cc
Hortaliças e derivados	Cenoura	KG	60,000	1,72	103,20	Alterar	40c98473da92f8307c6a08e59e2948b4b708ce3c20010ace18d54f5f8c3527cc
Hortaliças e derivados	Repolho	KG	91,600	0,92	84,27	Alterar	40c98473da92f8307c6a08e59e2948b4b708ce3c20010ace18d54f5f8c3527cc
Hortaliças e derivados	Cenoura	KG	800,000	1,72	1.376,00	Alterar	1544b69f7b1ac0cb80ac107146bf14a7a27e451d5e05c9eb1c5122f3d648cc89
Hortaliças e derivados	Couve manteiga	KG	14,000	3,65	51,10	Alterar	1544b69f7b1ac0cb80ac107146bf14a7a27e451d5e05c9eb1c5122f3d648cc89
Hortaliças e derivados	Alface	KG	113,750	2,84	323,05	Alterar	c456a31c6740a9b377979c4d7254c418b315c01342437507ddc84aed00b013eb
Hortaliças e derivados	Couve manteiga	KG	106,000	3,65	386,90	Alterar	89bd92f35ccdef898e77d3f306ae5bb3029724a2187484b3936d0d4f06af0d84
Hortaliças e derivados	Pepino	KG	875,500	2,63	2.302,57	Alterar	1cb31df0eb258be14f6a8031c950063bff0cdf274b5eb32ae3dd2cdcd732ddc3
Hortaliças e derivados	Acelga	KG	103,000	1,07	110,21	Alterar	1d2d3c3b88c2f3278b5d337c139fcab6ff53c7e94b40e777cd1b0f4cf63df3ba
Hortaliças e derivados	Cenoura	KG	760,000	2,29	1.740,40	Alterar	d21980edfc997729c7d4f1be635403141bf2e5ccd916642c8a6f8922e5299044
Hortaliças e derivados	Vagem	KG	147,900	4,88	721,75	Alterar	dbfbca08058076c5acedd98375316302bb152260d6f1ed535b8bc6682a69af11
Hortaliças e derivados	Couve manteiga	KG	150,000	4,08	612,00	Alterar	88980dff671b2ec43bef4d21fb24113d48792a8cbd0a656901dfaf0a2b8c86bd
Hortaliças e derivados	Abóbora	KG	158,100	1,07	169,17	Alterar	f0e9c6c4ad9c668a88fb7398a36c6e34678e2c2f9844f83e119813ba33c6bc8f
Hortaliças e derivados	Alface	KG	318,250	2,84	903,83	Alterar	2b3464d84e830a7bf87f8f9e863ca739b8d486b3c2014b91383e2c479dd042ef
Hortaliças e derivados	Tomate salada	KG	506,000	3,44	1.740,64	Alterar	1b7f5d02780eef7dac4bb3ae38800547806de862376522e454a632d2e471d190
Frutas e derivados	Laranja	KG	94,000	1,07	100,58	Alterar	dece5a804afe48e7b426ec19e2a57a3b423d93d28800a18681fe4da292b6af99
Hortaliças e derivados	Tomate salada	KG	60,000	2,41	144,60	Alterar	dece5a804afe48e7b426ec19e2a57a3b423d93d28800a18681fe4da292b6af99
Hortaliças e derivados	Alface	KG	73,300	2,84	208,17	Alterar	00751a3f97604768f1aecd63e0dc01b51eb085f9ec0549c9d1cb15d380fda824
Frutas e derivados	Goiaba vermelha	KG	1.470,200	3,20	4.704,64	Alterar	f4644afcc01e2ef692e2220c57b0344c523ab5f16dc8beb4858a72df90c6629f
Cereais e derivados	Arroz tipo 1	KG	12.000,000	2,60	31.200,00	Alterar	2a24a25f4ded2bd688a2be6eabffd42d46c71ddadcc4028120b4585954ce8f0b
Hortaliças e derivados	Tomate com semente	KG	602,900	2,88	1.736,35	Alterar	85daff915de956303064a961201ea4089068d9236e46a4185897ff6b41110bd1
Hortaliças e derivados	Alface americana	KG	51,200	2,93	150,02	Alterar	5bb2365e96a3f938620e8f02746e62d79e7b5c21621f2f303e1c29d9beeed562
Hortaliças e derivados	Cheiro verde	KG	6,100	5,66	34,53	Alterar	5bb2365e96a3f938620e8f02746e62d79e7b5c21621f2f303e1c29d9beeed562
Hortaliças e derivados	Acelga	KG	68,000	2,19	148,92	Alterar	44d2c07c6ab4cc0e20629a9889c327755bb98c1c818ce4ce0b011ccf8b68d035
Hortaliças e derivados	Cenoura	KG	24,300	1,74	42,28	Alterar	44d2c07c6ab4cc0e20629a9889c327755bb98c1c818ce4ce0b011ccf8b68d035
Hortaliças e derivados	Couve manteiga	KG	33,100	3,22	106,58	Alterar	44d2c07c6ab4cc0e20629a9889c327755bb98c1c818ce4ce0b011ccf8b68d035
Hortaliças e derivados	Couve manteiga	KG	21,600	4,08	88,13	Alterar	1e455d3dc0996c1f6bab64be673ae86d274ead577161eee6fda95ba9f41894e6
Hortaliças e derivados	Mandioca	KG	1.386,750	1,14	1.580,90	Alterar	1f3a7944b8f32f8704c1db4ddf684388ce811eed65455b519b4217cd0053539a
Frutas e derivados	Laranja da terra	KG	1.370,800	1,25	1.713,50	Alterar	a3349699b8e165223e23277bd18097b0d175b4e8421c0d6ffcc50d7920398ddb
Frutas e derivados	Mamão Papaia	KG	753,500	2,05	1.544,68	Alterar	a3349699b8e165223e23277bd18097b0d175b4e8421c0d6ffcc50d7920398ddb
Hortaliças e derivados	Cenoura	KG	1.491,550	1,74	2.595,30	Alterar	a3349699b8e165223e23277bd18097b0d175b4e8421c0d6ffcc50d7920398ddb
Frutas e derivados	Goiaba vermelha	KG	598,100	3,20	1.913,92	Alterar	c4110dad1fdc57390fa658c04f07c676010c0e41d1957b071c0c568ed72f16cf
Hortaliças e derivados	Mandioca	KG	175,200	1,42	248,78	Alterar	fbdc8f8ee5609b1d0d49bbb66db1d271d69f4166f4368094c3f15dcd71b0102e
Hortaliças e derivados	Cenoura	KG	56,600	1,74	98,48	Alterar	490b3312a9a01b86290f1b6f9f86a2fa12d541a4e4bb26c25089b1eebbdd9d04
Hortaliças e derivados	Couve manteiga	KG	650,000	3,22	2.093,00	Alterar	490b3312a9a01b86290f1b6f9f86a2fa12d541a4e4bb26c25089b1eebbdd9d04
Hortaliças e derivados	Repolho branco	KG	304,600	1,39	423,39	Alterar	490b3312a9a01b86290f1b6f9f86a2fa12d541a4e4bb26c25089b1eebbdd9d04
Pescados e frutos do mar	Merluza, filé	KG	434,190	8,94	3.881,74	Alterar	8f3f2db08c5363a65c223e7c63303f35283504731dd53f2a65b25e88ee95b8ad
Cereais e derivados	Fubá de canjica	KG	115,650	2,40	277,56	Alterar	b242172ae233c615ad8fcfd5a17041e291d52c4a625a232e229f0e1406653782
Outros Gêneros Alimentícios	Sal refinado/iodado	KG	214,200	1,80	385,56	Alterar	b242172ae233c615ad8fcfd5a17041e291d52c4a625a232e229f0e1406653782
Preparações prontas	Molho de tomate industrializado	KG	4.200,000	6,00	25.200,00	Alterar	6832e4d1b81868d3b9414d8f2ad1f301a8f05a3a845b3af6d51983c431f64f14
Cereais e derivados	Arroz tipo 1	KG	6.000,000	2,60	15.600,00	Alterar	27dd7277808fe523f70ed0cea0dc4fde1a42de15566f24a2585bf197717c39d9
Hortaliças e derivados	Alho	KG	135,400	10,61	1.436,59	Alterar	6c0e3f5ff6e5edddc39187235a5b4010b64b85196f57bd5e1f1ed1ba1c877397
Açúcares e doces	Açúcar cristal	KG	3.000,000	3,10	9.300,00	Alterar	29b0822d07dff2800a0918dc245bcba9d6873421f096fa1b25bb1f8c0fa94d59
Gorduras e óleos	Margarina com óleo hidrogenado, com sal (65% de lipídeos)	KG	1.068,000	3,40	3.631,20	Alterar	29b0822d07dff2800a0918dc245bcba9d6873421f096fa1b25bb1f8c0fa94d59
Gorduras e óleos	Óleo de soja	LITRO	2.844,000	5,70	16.210,80	Alterar	29b0822d07dff2800a0918dc245bcba9d6873421f096fa1b25bb1f8c0fa94d59
Carnes e derivados	Carne bovina, patinho, sem gordura	KG	318,000	13,00	4.134,00	Alterar	560f0ea375320c7699eba05cd73503c6c8f9284995c26c03518340e016a301ad
Carnes e derivados	Carne moída	KG	480,000	12,98	6.230,40	Alterar	560f0ea375320c7699eba05cd73503c6c8f9284995c26c03518340e016a301ad
Carnes e derivados	Frango, coxa, sem pele	KG	1.674,000	8,54	14.295,96	Alterar	560f0ea375320c7699eba05cd73503c6c8f9284995c26c03518340e016a301ad
Carnes e derivados	Linguiça de frango	KG	1.335,000	8,00	10.680,00	Alterar	560f0ea375320c7699eba05cd73503c6c8f9284995c26c03518340e016a301ad
Carnes e derivados	Porco, pernil	KG	1.364,000	8,68	11.839,52	Alterar	560f0ea375320c7699eba05cd73503c6c8f9284995c26c03518340e016a301ad
Preparações prontas	Filezinho de frango em tiras, temperado e grelhado	KG	78,000	8,54	666,12	Alterar	560f0ea375320c7699eba05cd73503c6c8f9284995c26c03518340e016a301ad
Frutas e derivados	Goiaba branca	KG	385,000	3,20	1.232,00	Alterar	2c22b57ecedcb976c075b7fa95a500111ffdce40ef56609cae82603bd1b15357
Frutas e derivados	Goiaba vermelha	KG	443,750	2,88	1.278,00	Alterar	e34d284ae0a60bdd1e80f8a67a8c88123b8594bf1cbca802c67141309b510d78
\.


--
-- TOC entry 2983 (class 0 OID 23567)
-- Dependencies: 194
-- Data for Name: extractlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.extractlog ("initTime", "endTime", "liberadaContasOnline", "fimPrestacaoContasAno", "faseId", "entidadeId", "situacaoId", "tipoConcessaoId", "entidadeCnpj", "codIbge", "fimVigenciaConvenio", "pcId", "tipoConcessaoNome", "tipoConcessaoConvenio", "colId", "fimVigenciaConvenioAno", "situacaoPCId", "fimPrestacaoContas", "faseNome", "ufNome", "pcIncluida", "tipoConcessaoRepasse", "programaId", "anoConcessao", "situacaoNome", "entidadeNome", "dataAssinaturaConvenio", "municipioId", "valorTotalPago", "totalRegistros", "demandaMonitorada", "tipoBotao", "permiteAcessoSigecon", "programaNome", "municipioNome", "situacaoPCNome", sha256_id) FROM stdin;
2021-07-02T09:09:47-03:00	2021-07-02T09:48:53-03:00	S	2021	204	000000280619	200	2	45.358.249/0001-01	3548906	31/12/2019	2559296	Repasse	FALSE	543	2019	207	01/03/2021	An�lise	SP	N	TRUE	C7	2019	Adimplente	PREF MUN DE SAO CARLOS	01/01/2019	354890	2.305.150,00	637	FALSE	0	S	ALIMENTA��O ESCOLAR	SAO CARLOS	Aguardando An�lise	976707a28fdf8c2d2ff58f926129d801be6c21a208b5dd3bb75887e62ec5c10f
2021-07-02T08:08:21-03:00	2021-07-02T09:09:27-03:00	S	2019	204	000000280619	200	2	45.358.249/0001-01	3548906	31/12/2018	2456510	Repasse	FALSE	546	2018	207	14/06/2019	An�lise	SP	N	TRUE	C7	2018	Adimplente	PREF MUN DE SAO CARLOS	01/01/2018	354890	2.230.344,00	643	FALSE	0	S	ALIMENTA��O ESCOLAR	SAO CARLOS	Aguardando An�lise	871f46e93c95b34c1832940d3241d65a6b137529ec661d4cdeaa9829532b4321
2021-07-02T07:20:51-03:00	2021-07-02T08:08:20-03:00	S	2018	204	000000280619	200	2	45.358.249/0001-01	3548906	31/12/2017	2404486	Repasse	FALSE	544	2017	207	15/02/2018	An�lise	SP	N	TRUE	C7	2017	Adimplente	PREF MUN DE SAO CARLOS	01/01/2017	354890	2.220.038,00	641	FALSE	0	S	ALIMENTA��O ESCOLAR	SAO CARLOS	Aguardando An�lise	21bfd17dea822e39c83f957c9dbc9b3bdb0435d500f6968a3449a0e091296fce
2021-07-02T06:36:48-03:00	2021-07-02T07:20:27-03:00	S	2017	204	000000280619	200	2	45.358.249/0001-01	3548906	31/12/2016	2361150	Repasse	FALSE	545	2016	207	21/08/2017	An�lise	SP	N	TRUE	C7	2016	Adimplente	PREF MUN DE SAO CARLOS	01/01/2016	354890	2.397.148,00	642	FALSE	0	S	ALIMENTA��O ESCOLAR	SAO CARLOS	Aguardando An�lise	d60505ed2698f348e90a38ba9ce9845b305a3d49ffcac0b203c50fad13b1ed6a
2021-07-02T04:59:34-03:00	2021-07-02T06:36:47-03:00	S	2016	204	000000280619	200	2	45.358.249/0001-01	3548906	31/12/2015	2321925	Repasse	FALSE	548	2015	207	01/04/2016	An�lise	SP	N	TRUE	C7	2015	Adimplente	PREF MUN DE SAO CARLOS	01/01/2015	354890	3.671.652,00	645	FALSE	0	S	ALIMENTA��O ESCOLAR	SAO CARLOS	Aguardando An�lise	d4f8dd5a0877ade0a96e9b22d273c48f809f3e95e33a09d82ad7814a34f49ac9
2021-07-02T02:55:49-03:00	2021-07-02T04:59:32-03:00	S	2015	204	000000280619	200	2	45.358.249/0001-01	3548906	31/12/2014	2286162	Repasse	FALSE	547	2014	207	15/02/2015	An�lise	SP	N	TRUE	C7	2014	Adimplente	PREF MUN DE SAO CARLOS	01/01/2014	354890	3.327.204,00	644	FALSE	0	S	ALIMENTA��O ESCOLAR	SAO CARLOS	Aguardando An�lise	81b6cc1ad528164f10f9b241235481decf04f03330e002f9b2827b1dc8255426
2021-07-02T02:01:58-03:00	2021-07-02T02:55:49-03:00	S	2014	204	000000280619	200	2	45.358.249/0001-01	3548906	31/12/2013	2216978	Repasse	FALSE	547	2013	207	30/06/2014	An�lise	SP	N	TRUE	C7	2013	Adimplente	PREF MUN DE SAO CARLOS	01/01/2013	354890	3.649.396,00	642	FALSE	0	S	ALIMENTA��O ESCOLAR	SAO CARLOS	Aguardando An�lise	50e77144a061682ef124fa51c38f9d1dd0b2f446326e4ecccab3fe8044c6b8a8
\.


--
-- TOC entry 2847 (class 0 OID 19217)
-- Dependencies: 187
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 2850 (class 2606 OID 23546)
-- Name: dataidentification dataidentification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dataidentification
    ADD CONSTRAINT dataidentification_pkey PRIMARY KEY (sha256_id);


--
-- TOC entry 2852 (class 2606 OID 23554)
-- Name: docinfo docinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docinfo
    ADD CONSTRAINT docinfo_pkey PRIMARY KEY (nf_c4ai_id);


--
-- TOC entry 2854 (class 2606 OID 23574)
-- Name: extractlog extractlog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extractlog
    ADD CONSTRAINT extractlog_pkey PRIMARY KEY (sha256_id);


--
-- TOC entry 2856 (class 2606 OID 23581)
-- Name: docitems_933d0521 docitems_933d0521_nf_c4ai_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docitems_933d0521
    ADD CONSTRAINT docitems_933d0521_nf_c4ai_id_fkey FOREIGN KEY (nf_c4ai_id) REFERENCES public.docinfo(nf_c4ai_id);


--
-- TOC entry 2855 (class 2606 OID 23561)
-- Name: docitems_f0236512 docitems_f0236512_nf_c4ai_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docitems_f0236512
    ADD CONSTRAINT docitems_f0236512_nf_c4ai_id_fkey FOREIGN KEY (nf_c4ai_id) REFERENCES public.docinfo(nf_c4ai_id);


--
-- TOC entry 2857 (class 2606 OID 23592)
-- Name: docitems_f1ecd601 docitems_f1ecd601_nf_c4ai_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docitems_f1ecd601
    ADD CONSTRAINT docitems_f1ecd601_nf_c4ai_id_fkey FOREIGN KEY (nf_c4ai_id) REFERENCES public.docinfo(nf_c4ai_id);


-- Completed on 2021-11-15 18:43:20

--
-- PostgreSQL database dump complete
--

