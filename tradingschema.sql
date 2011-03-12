--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: javatest; Type: SCHEMA; Schema: -; Owner: trader1
--

CREATE SCHEMA javatest;


ALTER SCHEMA javatest OWNER TO trader1;

--
-- Name: sqlj; Type: SCHEMA; Schema: -; Owner: trader1
--

CREATE SCHEMA sqlj;


ALTER SCHEMA sqlj OWNER TO trader1;

SET search_path = sqlj, pg_catalog;

--
-- Name: java_call_handler(); Type: FUNCTION; Schema: sqlj; Owner: trader1
--

CREATE FUNCTION java_call_handler() RETURNS language_handler
    LANGUAGE c
    AS 'pljava', 'java_call_handler';


ALTER FUNCTION sqlj.java_call_handler() OWNER TO trader1;

--
-- Name: java; Type: PROCEDURAL LANGUAGE; Schema: sqlj; Owner: trader1
--

CREATE TRUSTED PROCEDURAL LANGUAGE java HANDLER java_call_handler;


ALTER PROCEDURAL LANGUAGE java OWNER TO trader1;

--
-- Name: javau_call_handler(); Type: FUNCTION; Schema: sqlj; Owner: trader1
--

CREATE FUNCTION javau_call_handler() RETURNS language_handler
    LANGUAGE c
    AS 'pljava', 'javau_call_handler';


ALTER FUNCTION sqlj.javau_call_handler() OWNER TO trader1;

--
-- Name: javau; Type: PROCEDURAL LANGUAGE; Schema: sqlj; Owner: trader1
--

CREATE PROCEDURAL LANGUAGE javau HANDLER javau_call_handler;


ALTER PROCEDURAL LANGUAGE javau OWNER TO trader1;

--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: trader1
--

CREATE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO trader1;

--
-- Name: plpythonu; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: trader1
--

CREATE PROCEDURAL LANGUAGE plpythonu;


ALTER PROCEDURAL LANGUAGE plpythonu OWNER TO trader1;

SET search_path = public, pg_catalog;

--
-- Name: plr_call_handler(); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION plr_call_handler() RETURNS language_handler
    LANGUAGE c
    AS '$libdir/plr', 'plr_call_handler';


ALTER FUNCTION public.plr_call_handler() OWNER TO trader1;

--
-- Name: plr; Type: PROCEDURAL LANGUAGE; Schema: public; Owner: trader1
--

CREATE PROCEDURAL LANGUAGE plr HANDLER plr_call_handler;


ALTER PROCEDURAL LANGUAGE plr OWNER TO trader1;

SET search_path = javatest, pg_catalog;

--
-- Name: _properties; Type: TYPE; Schema: javatest; Owner: trader1
--

CREATE TYPE _properties AS (
	name character varying(200),
	value character varying(200)
);


ALTER TYPE javatest._properties OWNER TO trader1;

--
-- Name: _testsetreturn; Type: TYPE; Schema: javatest; Owner: trader1
--

CREATE TYPE _testsetreturn AS (
	base integer,
	incbase integer,
	ctime timestamp with time zone
);


ALTER TYPE javatest._testsetreturn OWNER TO trader1;

--
-- Name: binarycolumnpair; Type: TYPE; Schema: javatest; Owner: trader1
--

CREATE TYPE binarycolumnpair AS (
	col1 bytea,
	col2 bytea
);


ALTER TYPE javatest.binarycolumnpair OWNER TO trader1;

--
-- Name: complex; Type: SHELL TYPE; Schema: javatest; Owner: trader1
--

CREATE TYPE complex;


--
-- Name: complex_in(cstring); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION complex_in(cstring) RETURNS complex
    LANGUAGE java IMMUTABLE STRICT
    AS $$UDT[org.postgresql.pljava.example.ComplexScalar] input$$;


ALTER FUNCTION javatest.complex_in(cstring) OWNER TO trader1;

--
-- Name: complex_out(complex); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION complex_out(complex) RETURNS cstring
    LANGUAGE java IMMUTABLE STRICT
    AS $$UDT[org.postgresql.pljava.example.ComplexScalar] output$$;


ALTER FUNCTION javatest.complex_out(complex) OWNER TO trader1;

--
-- Name: complex_recv(internal); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION complex_recv(internal) RETURNS complex
    LANGUAGE java IMMUTABLE STRICT
    AS $$UDT[org.postgresql.pljava.example.ComplexScalar] receive$$;


ALTER FUNCTION javatest.complex_recv(internal) OWNER TO trader1;

--
-- Name: complex_send(complex); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION complex_send(complex) RETURNS bytea
    LANGUAGE java IMMUTABLE STRICT
    AS $$UDT[org.postgresql.pljava.example.ComplexScalar] send$$;


ALTER FUNCTION javatest.complex_send(complex) OWNER TO trader1;

--
-- Name: complex; Type: TYPE; Schema: javatest; Owner: trader1
--

CREATE TYPE complex (
    INTERNALLENGTH = 16,
    INPUT = complex_in,
    OUTPUT = complex_out,
    RECEIVE = complex_recv,
    SEND = complex_send,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE javatest.complex OWNER TO trader1;

--
-- Name: complextuple; Type: TYPE; Schema: javatest; Owner: trader1
--

CREATE TYPE complextuple AS (
	x double precision,
	y double precision
);


ALTER TYPE javatest.complextuple OWNER TO trader1;

--
-- Name: metadatabooleans; Type: TYPE; Schema: javatest; Owner: trader1
--

CREATE TYPE metadatabooleans AS (
	method_name character varying(200),
	result boolean
);


ALTER TYPE javatest.metadatabooleans OWNER TO trader1;

--
-- Name: metadataints; Type: TYPE; Schema: javatest; Owner: trader1
--

CREATE TYPE metadataints AS (
	method_name character varying(200),
	result integer
);


ALTER TYPE javatest.metadataints OWNER TO trader1;

--
-- Name: metadatastrings; Type: TYPE; Schema: javatest; Owner: trader1
--

CREATE TYPE metadatastrings AS (
	method_name character varying(200),
	result character varying
);


ALTER TYPE javatest.metadatastrings OWNER TO trader1;

SET search_path = public, pg_catalog;

--
-- Name: activefuturestype; Type: TYPE; Schema: public; Owner: trader1
--

CREATE TYPE activefuturestype AS (
	symbol character varying(8),
	exchange character varying(8),
	multiplier integer,
	pricemagnifier integer,
	fullname character varying(56),
	mindate timestamp without time zone,
	maxdate timestamp without time zone,
	maxexpiry integer
);


ALTER TYPE public.activefuturestype OWNER TO trader1;

--
-- Name: beginendts; Type: TYPE; Schema: public; Owner: trader1
--

CREATE TYPE beginendts AS (
	bt timestamp without time zone,
	et timestamp without time zone
);


ALTER TYPE public.beginendts OWNER TO trader1;

--
-- Name: buysellpos; Type: TYPE; Schema: public; Owner: trader1
--

CREATE TYPE buysellpos AS ENUM (
    'BUY',
    'SELL'
);


ALTER TYPE public.buysellpos OWNER TO trader1;

--
-- Name: datedrange_type; Type: TYPE; Schema: public; Owner: trader1
--

CREATE TYPE datedrange_type AS (
	datetime timestamp without time zone,
	open numeric,
	high numeric,
	low numeric,
	close numeric,
	volume bigint
);


ALTER TYPE public.datedrange_type OWNER TO trader1;

--
-- Name: paperordertype; Type: TYPE; Schema: public; Owner: trader1
--

CREATE TYPE paperordertype AS ENUM (
    'BuyToOpen',
    'SellToOpen',
    'SellProfitToClose',
    'SellLossToClose',
    'BuyProfitToClose',
    'BuyLossToClose'
);


ALTER TYPE public.paperordertype OWNER TO trader1;

--
-- Name: plr_environ_type; Type: TYPE; Schema: public; Owner: trader1
--

CREATE TYPE plr_environ_type AS (
	name text,
	value text
);


ALTER TYPE public.plr_environ_type OWNER TO trader1;

--
-- Name: r_typename; Type: TYPE; Schema: public; Owner: trader1
--

CREATE TYPE r_typename AS (
	typename text,
	typeoid oid
);


ALTER TYPE public.r_typename OWNER TO trader1;

--
-- Name: r_version_type; Type: TYPE; Schema: public; Owner: trader1
--

CREATE TYPE r_version_type AS (
	name text,
	value text
);


ALTER TYPE public.r_version_type OWNER TO trader1;

--
-- Name: status; Type: TYPE; Schema: public; Owner: trader1
--

CREATE TYPE status AS ENUM (
    'PendingSubmit',
    'PendingCancel',
    'PreSubmitted',
    'Submitted',
    'Cancelled',
    'Filled',
    'Inactive'
);


ALTER TYPE public.status OWNER TO trader1;

--
-- Name: symbolmaxdatelastexpiry; Type: TYPE; Schema: public; Owner: trader1
--

CREATE TYPE symbolmaxdatelastexpiry AS (
	symbol character varying(8),
	maxdate timestamp without time zone,
	maxexpiry integer
);


ALTER TYPE public.symbolmaxdatelastexpiry OWNER TO trader1;

--
-- Name: symbolminmaxdates; Type: TYPE; Schema: public; Owner: trader1
--

CREATE TYPE symbolminmaxdates AS (
	symbol character varying,
	mindate timestamp without time zone,
	maxdate timestamp without time zone
);


ALTER TYPE public.symbolminmaxdates OWNER TO trader1;

SET search_path = javatest, pg_catalog;

--
-- Name: after_username_insert(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION after_username_insert() RETURNS trigger
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Triggers.afterUsernameInsert$$;


ALTER FUNCTION javatest.after_username_insert() OWNER TO trader1;

--
-- Name: after_username_update(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION after_username_update() RETURNS trigger
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Triggers.afterUsernameUpdate$$;


ALTER FUNCTION javatest.after_username_update() OWNER TO trader1;

--
-- Name: binarycolumntest(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION binarycolumntest() RETURNS SETOF binarycolumnpair
    LANGUAGE java IMMUTABLE
    AS $$org.postgresql.pljava.example.BinaryColumnTest.getBinaryPairs$$;


ALTER FUNCTION javatest.binarycolumntest() OWNER TO trader1;

--
-- Name: callmetadatamethod(character varying); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION callmetadatamethod(character varying) RETURNS SETOF character varying
    LANGUAGE java
    AS $$org.postgresql.pljava.example.MetaDataTest.callMetaDataMethod$$;


ALTER FUNCTION javatest.callmetadatamethod(character varying) OWNER TO trader1;

--
-- Name: complexdummy(cstring); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION complexdummy(cstring) RETURNS complex
    LANGUAGE internal
    AS $$lower$$;


ALTER FUNCTION javatest.complexdummy(cstring) OWNER TO trader1;

--
-- Name: countnulls(record); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION countnulls(record) RETURNS integer
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.countNulls$$;


ALTER FUNCTION javatest.countnulls(record) OWNER TO trader1;

--
-- Name: countnulls(integer[]); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION countnulls(integer[]) RETURNS integer
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.countNulls(java.lang.Integer[])$$;


ALTER FUNCTION javatest.countnulls(integer[]) OWNER TO trader1;

--
-- Name: create_temp_file_trusted(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION create_temp_file_trusted() RETURNS character varying
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Security.createTempFile$$;


ALTER FUNCTION javatest.create_temp_file_trusted() OWNER TO trader1;

--
-- Name: executeselect(character varying); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION executeselect(character varying) RETURNS SETOF character varying
    LANGUAGE java
    AS $$org.postgresql.pljava.example.ResultSetTest.executeSelect$$;


ALTER FUNCTION javatest.executeselect(character varying) OWNER TO trader1;

--
-- Name: executeselecttorecords(character varying); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION executeselecttorecords(character varying) RETURNS SETOF record
    LANGUAGE java
    AS $$org.postgresql.pljava.example.SetOfRecordTest.executeSelect$$;


ALTER FUNCTION javatest.executeselecttorecords(character varying) OWNER TO trader1;

--
-- Name: getdateasstring(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION getdateasstring() RETURNS character varying
    LANGUAGE java STABLE
    AS $$org.postgresql.pljava.example.SPIActions.getDateAsString$$;


ALTER FUNCTION javatest.getdateasstring() OWNER TO trader1;

--
-- Name: getmetadatabooleans(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION getmetadatabooleans() RETURNS SETOF metadatabooleans
    LANGUAGE java
    AS $$org.postgresql.pljava.example.MetaDataBooleans.getDatabaseMetaDataBooleans$$;


ALTER FUNCTION javatest.getmetadatabooleans() OWNER TO trader1;

--
-- Name: getmetadataints(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION getmetadataints() RETURNS SETOF metadataints
    LANGUAGE java
    AS $$org.postgresql.pljava.example.MetaDataInts.getDatabaseMetaDataInts$$;


ALTER FUNCTION javatest.getmetadataints() OWNER TO trader1;

--
-- Name: getmetadatastrings(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION getmetadatastrings() RETURNS SETOF metadatastrings
    LANGUAGE java
    AS $$org.postgresql.pljava.example.MetaDataStrings.getDatabaseMetaDataStrings$$;


ALTER FUNCTION javatest.getmetadatastrings() OWNER TO trader1;

--
-- Name: getsysprop(character varying); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION getsysprop(character varying) RETURNS character varying
    LANGUAGE java
    AS $$java.lang.System.getProperty$$;


ALTER FUNCTION javatest.getsysprop(character varying) OWNER TO trader1;

--
-- Name: gettimeasstring(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION gettimeasstring() RETURNS character varying
    LANGUAGE java STABLE
    AS $$org.postgresql.pljava.example.SPIActions.getTimeAsString$$;


ALTER FUNCTION javatest.gettimeasstring() OWNER TO trader1;

--
-- Name: hugenonimmutableresult(integer); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION hugenonimmutableresult(integer) RETURNS SETOF _testsetreturn
    LANGUAGE java
    AS $$org.postgresql.pljava.example.HugeResultSet.executeSelect$$;


ALTER FUNCTION javatest.hugenonimmutableresult(integer) OWNER TO trader1;

--
-- Name: hugeresult(integer); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION hugeresult(integer) RETURNS SETOF _testsetreturn
    LANGUAGE java IMMUTABLE
    AS $$org.postgresql.pljava.example.HugeResultSet.executeSelect$$;


ALTER FUNCTION javatest.hugeresult(integer) OWNER TO trader1;

--
-- Name: insert_username(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION insert_username() RETURNS trigger
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Triggers.insertUsername$$;


ALTER FUNCTION javatest.insert_username() OWNER TO trader1;

--
-- Name: java_addone(integer); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION java_addone(integer) RETURNS integer
    LANGUAGE java IMMUTABLE
    AS $$org.postgresql.pljava.example.Parameters.addOne(java.lang.Integer)$$;


ALTER FUNCTION javatest.java_addone(integer) OWNER TO trader1;

--
-- Name: java_getsystemproperty(character varying); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION java_getsystemproperty(character varying) RETURNS character varying
    LANGUAGE java
    AS $$java.lang.System.getProperty$$;


ALTER FUNCTION javatest.java_getsystemproperty(character varying) OWNER TO trader1;

--
-- Name: java_gettimestamp(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION java_gettimestamp() RETURNS timestamp without time zone
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.getTimestamp$$;


ALTER FUNCTION javatest.java_gettimestamp() OWNER TO trader1;

--
-- Name: java_gettimestamptz(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION java_gettimestamptz() RETURNS timestamp with time zone
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.getTimestamp$$;


ALTER FUNCTION javatest.java_gettimestamptz() OWNER TO trader1;

--
-- Name: leak_statements(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION leak_statements() RETURNS trigger
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Triggers.leakStatements$$;


ALTER FUNCTION javatest.leak_statements() OWNER TO trader1;

--
-- Name: listnonsupers(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION listnonsupers() RETURNS SETOF pg_user
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Users.listNonSupers$$;


ALTER FUNCTION javatest.listnonsupers() OWNER TO trader1;

--
-- Name: listsupers(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION listsupers() RETURNS SETOF pg_user
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Users.listSupers$$;


ALTER FUNCTION javatest.listsupers() OWNER TO trader1;

--
-- Name: logany("any"); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION logany("any") RETURNS void
    LANGUAGE java IMMUTABLE STRICT
    AS $$org.postgresql.pljava.example.AnyTest.logAny$$;


ALTER FUNCTION javatest.logany("any") OWNER TO trader1;

--
-- Name: loganyelement(anyelement); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION loganyelement(anyelement) RETURNS anyelement
    LANGUAGE java IMMUTABLE STRICT
    AS $$org.postgresql.pljava.example.AnyTest.logAnyElement$$;


ALTER FUNCTION javatest.loganyelement(anyelement) OWNER TO trader1;

--
-- Name: logcomplex(complex); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION logcomplex(complex) RETURNS complex
    LANGUAGE java IMMUTABLE STRICT
    AS $$org.postgresql.pljava.example.ComplexScalar.logAndReturn$$;


ALTER FUNCTION javatest.logcomplex(complex) OWNER TO trader1;

--
-- Name: logcomplex(complextuple); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION logcomplex(complextuple) RETURNS complextuple
    LANGUAGE java IMMUTABLE STRICT
    AS $$org.postgresql.pljava.example.ComplexTuple.logAndReturn$$;


ALTER FUNCTION javatest.logcomplex(complextuple) OWNER TO trader1;

--
-- Name: logmessage(character varying, character varying); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION logmessage(character varying, character varying) RETURNS void
    LANGUAGE java IMMUTABLE
    AS $$org.postgresql.pljava.example.LoggerTest.logMessage$$;


ALTER FUNCTION javatest.logmessage(character varying, character varying) OWNER TO trader1;

--
-- Name: makearray(anyelement); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION makearray(anyelement) RETURNS anyarray
    LANGUAGE java IMMUTABLE STRICT
    AS $$org.postgresql.pljava.example.AnyTest.makeArray$$;


ALTER FUNCTION javatest.makearray(anyelement) OWNER TO trader1;

--
-- Name: maxfromsetreturnexample(integer, integer); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION maxfromsetreturnexample(integer, integer) RETURNS integer
    LANGUAGE java IMMUTABLE
    AS $$org.postgresql.pljava.example.SPIActions.maxFromSetReturnExample$$;


ALTER FUNCTION javatest.maxfromsetreturnexample(integer, integer) OWNER TO trader1;

--
-- Name: moddatetime(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION moddatetime() RETURNS trigger
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Triggers.moddatetime$$;


ALTER FUNCTION javatest.moddatetime() OWNER TO trader1;

--
-- Name: nestedstatements(integer); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION nestedstatements(integer) RETURNS void
    LANGUAGE java
    AS $$org.postgresql.pljava.example.SPIActions.nestedStatements$$;


ALTER FUNCTION javatest.nestedstatements(integer) OWNER TO trader1;

--
-- Name: nulloneven(integer); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION nulloneven(integer) RETURNS integer
    LANGUAGE java IMMUTABLE
    AS $$org.postgresql.pljava.example.Parameters.nullOnEven$$;


ALTER FUNCTION javatest.nulloneven(integer) OWNER TO trader1;

--
-- Name: print(date); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION print(date) RETURNS void
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.print$$;


ALTER FUNCTION javatest.print(date) OWNER TO trader1;

--
-- Name: print(time with time zone); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION print(time with time zone) RETURNS void
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.print$$;


ALTER FUNCTION javatest.print(time with time zone) OWNER TO trader1;

--
-- Name: print(timestamp with time zone); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION print(timestamp with time zone) RETURNS void
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.print$$;


ALTER FUNCTION javatest.print(timestamp with time zone) OWNER TO trader1;

--
-- Name: print("char"); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION print("char") RETURNS "char"
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.print$$;


ALTER FUNCTION javatest.print("char") OWNER TO trader1;

--
-- Name: print(bytea); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION print(bytea) RETURNS bytea
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.print$$;


ALTER FUNCTION javatest.print(bytea) OWNER TO trader1;

--
-- Name: print(smallint); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION print(smallint) RETURNS smallint
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.print$$;


ALTER FUNCTION javatest.print(smallint) OWNER TO trader1;

--
-- Name: print(smallint[]); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION print(smallint[]) RETURNS smallint[]
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.print$$;


ALTER FUNCTION javatest.print(smallint[]) OWNER TO trader1;

--
-- Name: print(integer); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION print(integer) RETURNS integer
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.print$$;


ALTER FUNCTION javatest.print(integer) OWNER TO trader1;

--
-- Name: print(integer[]); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION print(integer[]) RETURNS integer[]
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.print$$;


ALTER FUNCTION javatest.print(integer[]) OWNER TO trader1;

--
-- Name: print(bigint); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION print(bigint) RETURNS bigint
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.print$$;


ALTER FUNCTION javatest.print(bigint) OWNER TO trader1;

--
-- Name: print(bigint[]); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION print(bigint[]) RETURNS bigint[]
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.print$$;


ALTER FUNCTION javatest.print(bigint[]) OWNER TO trader1;

--
-- Name: print(real); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION print(real) RETURNS real
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.print$$;


ALTER FUNCTION javatest.print(real) OWNER TO trader1;

--
-- Name: print(real[]); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION print(real[]) RETURNS real[]
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.print$$;


ALTER FUNCTION javatest.print(real[]) OWNER TO trader1;

--
-- Name: print(double precision); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION print(double precision) RETURNS double precision
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.print$$;


ALTER FUNCTION javatest.print(double precision) OWNER TO trader1;

--
-- Name: print(double precision[]); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION print(double precision[]) RETURNS double precision[]
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.print$$;


ALTER FUNCTION javatest.print(double precision[]) OWNER TO trader1;

--
-- Name: printobj(integer[]); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION printobj(integer[]) RETURNS integer[]
    LANGUAGE java
    AS $$org.postgresql.pljava.example.Parameters.print(java.lang.Integer[])$$;


ALTER FUNCTION javatest.printobj(integer[]) OWNER TO trader1;

--
-- Name: propertyexample(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION propertyexample() RETURNS SETOF _properties
    LANGUAGE java IMMUTABLE
    AS $$org.postgresql.pljava.example.UsingProperties.getProperties$$;


ALTER FUNCTION javatest.propertyexample() OWNER TO trader1;

--
-- Name: randomints(integer); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION randomints(integer) RETURNS SETOF integer
    LANGUAGE java IMMUTABLE
    AS $$org.postgresql.pljava.example.RandomInts.createIterator$$;


ALTER FUNCTION javatest.randomints(integer) OWNER TO trader1;

--
-- Name: resultsetpropertyexample(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION resultsetpropertyexample() RETURNS SETOF _properties
    LANGUAGE java IMMUTABLE
    AS $$org.postgresql.pljava.example.UsingPropertiesAsResultSet.getProperties$$;


ALTER FUNCTION javatest.resultsetpropertyexample() OWNER TO trader1;

--
-- Name: scalarpropertyexample(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION scalarpropertyexample() RETURNS SETOF character varying
    LANGUAGE java IMMUTABLE
    AS $$org.postgresql.pljava.example.UsingPropertiesAsScalarSet.getProperties$$;


ALTER FUNCTION javatest.scalarpropertyexample() OWNER TO trader1;

--
-- Name: setreturnexample(integer, integer); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION setreturnexample(integer, integer) RETURNS SETOF _testsetreturn
    LANGUAGE java IMMUTABLE
    AS $$org.postgresql.pljava.example.TupleReturn.setReturn$$;


ALTER FUNCTION javatest.setreturnexample(integer, integer) OWNER TO trader1;

--
-- Name: testsavepointsanity(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION testsavepointsanity() RETURNS integer
    LANGUAGE java IMMUTABLE
    AS $$org.postgresql.pljava.example.SPIActions.testSavepointSanity$$;


ALTER FUNCTION javatest.testsavepointsanity() OWNER TO trader1;

--
-- Name: testtransactionrecovery(); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION testtransactionrecovery() RETURNS integer
    LANGUAGE java IMMUTABLE
    AS $$org.postgresql.pljava.example.SPIActions.testTransactionRecovery$$;


ALTER FUNCTION javatest.testtransactionrecovery() OWNER TO trader1;

--
-- Name: transferpeople(integer); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION transferpeople(integer) RETURNS integer
    LANGUAGE java
    AS $$org.postgresql.pljava.example.SPIActions.transferPeopleWithSalary$$;


ALTER FUNCTION javatest.transferpeople(integer) OWNER TO trader1;

--
-- Name: tuplereturnexample(integer, integer); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION tuplereturnexample(integer, integer) RETURNS _testsetreturn
    LANGUAGE java IMMUTABLE
    AS $$org.postgresql.pljava.example.TupleReturn.tupleReturn$$;


ALTER FUNCTION javatest.tuplereturnexample(integer, integer) OWNER TO trader1;

--
-- Name: tuplereturnexample2(integer, integer); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION tuplereturnexample2(integer, integer) RETURNS _testsetreturn
    LANGUAGE java IMMUTABLE
    AS $$org.postgresql.pljava.example.TupleReturn.tupleReturn(java.lang.Integer, java.lang.Integer, java.sql.ResultSet)$$;


ALTER FUNCTION javatest.tuplereturnexample2(integer, integer) OWNER TO trader1;

--
-- Name: tuplereturntostring(_testsetreturn); Type: FUNCTION; Schema: javatest; Owner: trader1
--

CREATE FUNCTION tuplereturntostring(_testsetreturn) RETURNS character varying
    LANGUAGE java IMMUTABLE
    AS $$org.postgresql.pljava.example.TupleReturn.makeString$$;


ALTER FUNCTION javatest.tuplereturntostring(_testsetreturn) OWNER TO trader1;

SET search_path = public, pg_catalog;

--
-- Name: activefuturesdetails(); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION activefuturesdetails() RETURNS SETOF activefuturestype
    LANGUAGE sql
    AS $$
  SELECT fc.symbol, fc.exchange, fc.multiplier, fc.priceMagnifier, fc.fullname,
       qm.minDate, qm.maxDate, qm.maxActiveExpiry
  FROM (SELECT distinct  symbol, exchange, multiplier,
                         priceMagnifier,
                         fullName FROM futuresContractDetails) as fc,
       (SELECT symbol, min(datetime) as minDate, max(datetime) as maxDate,
          max(expiry) as maxActiveExpiry FROM quotes1min
         group by symbol) as qm where qm.symbol = fc.symbol;
$$;


ALTER FUNCTION public.activefuturesdetails() OWNER TO trader1;

--
-- Name: add1(integer); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION add1(INOUT ain integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
   DECLARE ii integer;
   BEGIN
      ain = ain + 1;
      return;
   END;
   $$;


ALTER FUNCTION public.add1(INOUT ain integer) OWNER TO trader1;

--
-- Name: add2(integer); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION add2(ain integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
   DECLARE ii integer;
   BEGIN
      ii = ain;
      perform add1(ii);
      return ii;
   END;
   $$;


ALTER FUNCTION public.add2(ain integer) OWNER TO trader1;

--
-- Name: addone(integer); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION addone(testint integer) RETURNS integer
    LANGUAGE sql
    AS $_$
   select 1 + $1;
   $_$;


ALTER FUNCTION public.addone(testint integer) OWNER TO trader1;

--
-- Name: compressrows(character varying, timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION compressrows(sym character varying, begintime timestamp without time zone, endtime timestamp without time zone, OUT retrow datedrange_type) RETURNS datedrange_type
    LANGUAGE plpgsql
    AS $$
 DECLARE
    tmpRow datedRange_type%ROWTYPE;
    curs1 refcursor;
    BEGIN
       OPEN curs1 SCROLL FOR EXECUTE 
          'SELECT datetime, open, high, low, close, volume FROM quotes1min
          where symbol= ''' || sym || ''' and datetime >= ''' || beginTime || ''' and datetime < '''
          || endTime || ''' order by datetime';
       FETCH curs1 INTO retRow;
       LOOP
          FETCH curs1 INTO tmpRow;
          if not found then
             exit ;
          end if;
          if tmpRow.high > retRow.high then
             retRow.high = tmpRow.high;
             end if;
          if tmpRow.low < retRow.low then
             retRow.low = tmpRow.low;
             end if;
          retRow.volume = retRow.volume + tmpRow.volume;
          retRow.close = tmpRow.close;
          end loop;
    END
$$;


ALTER FUNCTION public.compressrows(sym character varying, begintime timestamp without time zone, endtime timestamp without time zone, OUT retrow datedrange_type) OWNER TO trader1;

--
-- Name: createcompressedtable(character varying, timestamp without time zone, timestamp without time zone, integer); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION createcompressedtable(sym character varying, begintime timestamp without time zone, endtime timestamp without time zone, compressionfactor integer) RETURNS SETOF datedrange_type
    LANGUAGE plpgsql
    AS $$
DECLARE
   retrow datedRange_type;
   curs1 refcursor;
   beginDateTime timestamp;
   endDateTime timestamp;
BEGIN
    OPEN curs1 SCROLL FOR EXECUTE 'SELECT CAST(generate_series(CAST(''' || beginTime || ''' As timestamp), 
    CAST(''' || endTime || ''' As timestamp), ''' || compressionFactor || ' minutes'') as timestamp)';
    FETCH curs1 INTO beginDateTime;
    LOOP
       FETCH curs1 INTO endDateTime;
       if not found then
          exit ;
       end if;
      select * into retrow from compressRows(sym, beginDateTime, endDateTime);
      beginDateTime = endDateTime;
      RETURN NEXT retrow;
    END LOOP;
    RETURN;
END;
$$;


ALTER FUNCTION public.createcompressedtable(sym character varying, begintime timestamp without time zone, endtime timestamp without time zone, compressionfactor integer) OWNER TO trader1;

--
-- Name: createcompressedtimeseries(timestamp without time zone, timestamp without time zone, integer); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION createcompressedtimeseries(begintime timestamp without time zone, endtime timestamp without time zone, compressionfactor integer) RETURNS SETOF timestamp without time zone
    LANGUAGE plpgsql
    AS $$
DECLARE
   retrow timestamp;
BEGIN   
   FOR retRow in EXECUTE 'SELECT CAST(generate_series(CAST(''' || beginTime || ''' As timestamp), 
    CAST(''' || endTime || ''' As timestamp), ''' || compressionFactor || ' minutes'') as timestamp)' LOOP
      RETURN NEXT retRow;
   END LOOP;
   RETURN;
END;
$$;


ALTER FUNCTION public.createcompressedtimeseries(begintime timestamp without time zone, endtime timestamp without time zone, compressionfactor integer) OWNER TO trader1;

--
-- Name: datedrangebysymbol(character varying, timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION datedrangebysymbol(character varying, timestamp without time zone, timestamp without time zone) RETURNS SETOF datedrange_type
    LANGUAGE sql
    AS $_$
SELECT datetime, open, high, low, close, volume FROM quotes1min
WHERE symbol = $1 and datetime >= $2 and datetime <= $3
ORDER BY datetime;
$_$;


ALTER FUNCTION public.datedrangebysymbol(character varying, timestamp without time zone, timestamp without time zone) OWNER TO trader1;

--
-- Name: distinctquotesymbols(); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION distinctquotesymbols() RETURNS TABLE(symbol text)
    LANGUAGE sql
    AS $$ select distinct symbol from quotes1min order by symbol;
$$;


ALTER FUNCTION public.distinctquotesymbols() OWNER TO trader1;

--
-- Name: fndumdecoder(text, text, text); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION fndumdecoder(randstring text, mapfrom text DEFAULT 'abcdedfhijklmnopqrstuvwxyz'::text, mapto text DEFAULT 'bcdefghijklmnopqrstuvwxyza'::text) RETURNS text
    LANGUAGE plpythonu
    AS $$
    import string
    mapt = string.maketrans(mapto, mapfrom)
    return randstring.lower().translate(mapt) 
$$;


ALTER FUNCTION public.fndumdecoder(randstring text, mapfrom text, mapto text) OWNER TO trader1;

--
-- Name: fndumencoder(text, text, text); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION fndumencoder(randstring text, mapfrom text DEFAULT 'abcdedfhijklmnopqrstuvwxyz'::text, mapto text DEFAULT 'bcdefghijklmnopqrstuvwxyza'::text) RETURNS text
    LANGUAGE plpythonu
    AS $$
    import string
    mapt = string.maketrans(mapfrom, mapto)
    return randstring.lower().translate(mapt) 
$$;


ALTER FUNCTION public.fndumencoder(randstring text, mapfrom text, mapto text) OWNER TO trader1;

--
-- Name: install_rcmd(text); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION install_rcmd(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/plr', 'install_rcmd';


ALTER FUNCTION public.install_rcmd(text) OWNER TO trader1;

--
-- Name: load_r_typenames(); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION load_r_typenames() RETURNS text
    LANGUAGE plr
    AS $$
  sql <- "select upper(typname::text) || 'OID' as typename, oid from pg_catalog.pg_type where typtype = 'b' order by typname"
  rs <- pg.spi.exec(sql)
  for(i in 1:nrow(rs))
  {
    typobj <- rs[i,1]
    typval <- rs[i,2]
    if (substr(typobj,1,1) == "_")
      typobj <- paste("ARRAYOF", substr(typobj,2,nchar(typobj)), sep="")
    assign(typobj, typval, .GlobalEnv)
  }
  return("OK")
$$;


ALTER FUNCTION public.load_r_typenames() OWNER TO trader1;

--
-- Name: minmaxdateforall(); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION minmaxdateforall() RETURNS SETOF symbolminmaxdates
    LANGUAGE sql
    AS $$
  SELECT symbol, min(datetime) as minDate, max(datetime) as maxDate
    FROM quotes1min group by symbol order by symbol;
$$;


ALTER FUNCTION public.minmaxdateforall() OWNER TO trader1;

--
-- Name: playitforward(character varying, timestamp without time zone, numeric, numeric); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION playitforward(character varying, timestamp without time zone, numeric, numeric) RETURNS datedrange_type
    LANGUAGE sql
    AS $_$
  SELECT datetime, open, high, low, close, volume FROM quotes1min
   where symbol= $1 and datetime > $2 and (high >= $3 or low <=  $4) order by
   datetime limit 1;
$_$;


ALTER FUNCTION public.playitforward(character varying, timestamp without time zone, numeric, numeric) OWNER TO trader1;

--
-- Name: playitforward2(character varying, timestamp without time zone, numeric, numeric, numeric); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION playitforward2(symbol character varying, begindt timestamp without time zone, entryprice numeric, hightarget numeric, lowtarget numeric) RETURNS timestamp without time zone
    LANGUAGE plpgsql
    AS $$
DECLARE
   tmpRow datedRange_type%ROWTYPE;
   BEGIN
      select * into tmpRow from playitforward('AUD', '2010-01-03', 0.90, 0.88);
      return tmpRow.datetime; --query select enteredindb from papertrades;
   END;
$$;


ALTER FUNCTION public.playitforward2(symbol character varying, begindt timestamp without time zone, entryprice numeric, hightarget numeric, lowtarget numeric) OWNER TO trader1;

--
-- Name: plr_array_accum(double precision[], double precision); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION plr_array_accum(double precision[], double precision) RETURNS double precision[]
    LANGUAGE c
    AS '$libdir/plr', 'plr_array_accum';


ALTER FUNCTION public.plr_array_accum(double precision[], double precision) OWNER TO trader1;

--
-- Name: plr_array_push(double precision[], double precision); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION plr_array_push(double precision[], double precision) RETURNS double precision[]
    LANGUAGE c STRICT
    AS '$libdir/plr', 'plr_array_push';


ALTER FUNCTION public.plr_array_push(double precision[], double precision) OWNER TO trader1;

--
-- Name: plr_environ(); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION plr_environ() RETURNS SETOF plr_environ_type
    LANGUAGE c
    AS '$libdir/plr', 'plr_environ';


ALTER FUNCTION public.plr_environ() OWNER TO trader1;

--
-- Name: plr_get_raw(bytea); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION plr_get_raw(bytea) RETURNS bytea
    LANGUAGE c STRICT
    AS '$libdir/plr', 'plr_get_raw';


ALTER FUNCTION public.plr_get_raw(bytea) OWNER TO trader1;

--
-- Name: plr_set_display(text); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION plr_set_display(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/plr', 'plr_set_display';


ALTER FUNCTION public.plr_set_display(text) OWNER TO trader1;

--
-- Name: plr_set_rhome(text); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION plr_set_rhome(text) RETURNS text
    LANGUAGE c STRICT
    AS '$libdir/plr', 'plr_set_rhome';


ALTER FUNCTION public.plr_set_rhome(text) OWNER TO trader1;

--
-- Name: plr_singleton_array(double precision); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION plr_singleton_array(double precision) RETURNS double precision[]
    LANGUAGE c STRICT
    AS '$libdir/plr', 'plr_array';


ALTER FUNCTION public.plr_singleton_array(double precision) OWNER TO trader1;

--
-- Name: plr_unset_rhome(); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION plr_unset_rhome() RETURNS text
    LANGUAGE c
    AS '$libdir/plr', 'plr_unset_rhome';


ALTER FUNCTION public.plr_unset_rhome() OWNER TO trader1;

--
-- Name: r_typenames(); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION r_typenames() RETURNS SETOF r_typename
    LANGUAGE plr
    AS $$
  x <- ls(name = .GlobalEnv, pat = "OID")
  y <- vector()
  for (i in 1:length(x)) {y[i] <- eval(parse(text = x[i]))}
  data.frame(typename = x, typeoid = y)
$$;


ALTER FUNCTION public.r_typenames() OWNER TO trader1;

--
-- Name: r_version(); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION r_version() RETURNS SETOF r_version_type
    LANGUAGE plr
    AS $$
  cbind(names(version),unlist(version))
$$;


ALTER FUNCTION public.r_version() OWNER TO trader1;

--
-- Name: reffunc(refcursor); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION reffunc(refcursor) RETURNS refcursor
    LANGUAGE plpgsql
    AS $_$
BEGIN
    OPEN $1 FOR SELECT col FROM test;
    RETURN $1;
END;
$_$;


ALTER FUNCTION public.reffunc(refcursor) OWNER TO trader1;

--
-- Name: reload_plr_modules(); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION reload_plr_modules() RETURNS text
    LANGUAGE c
    AS '$libdir/plr', 'reload_plr_modules';


ALTER FUNCTION public.reload_plr_modules() OWNER TO trader1;

--
-- Name: symbolmaxdatelastexpirylist(); Type: FUNCTION; Schema: public; Owner: trader1
--

CREATE FUNCTION symbolmaxdatelastexpirylist() RETURNS SETOF symbolmaxdatelastexpiry
    LANGUAGE sql
    AS $$
  SELECT symbol,max(datetime) as maxDate, max(expiry)
      as maxExpiry FROM quotes1min group by symbol order by symbol;
$$;


ALTER FUNCTION public.symbolmaxdatelastexpirylist() OWNER TO trader1;

SET search_path = sqlj, pg_catalog;

--
-- Name: add_type_mapping(character varying, character varying); Type: FUNCTION; Schema: sqlj; Owner: trader1
--

CREATE FUNCTION add_type_mapping(character varying, character varying) RETURNS void
    LANGUAGE java SECURITY DEFINER
    AS $$org.postgresql.pljava.management.Commands.addTypeMapping$$;


ALTER FUNCTION sqlj.add_type_mapping(character varying, character varying) OWNER TO trader1;

--
-- Name: drop_type_mapping(character varying); Type: FUNCTION; Schema: sqlj; Owner: trader1
--

CREATE FUNCTION drop_type_mapping(character varying) RETURNS void
    LANGUAGE java SECURITY DEFINER
    AS $$org.postgresql.pljava.management.Commands.dropTypeMapping$$;


ALTER FUNCTION sqlj.drop_type_mapping(character varying) OWNER TO trader1;

--
-- Name: get_classpath(character varying); Type: FUNCTION; Schema: sqlj; Owner: trader1
--

CREATE FUNCTION get_classpath(character varying) RETURNS character varying
    LANGUAGE java STABLE SECURITY DEFINER
    AS $$org.postgresql.pljava.management.Commands.getClassPath$$;


ALTER FUNCTION sqlj.get_classpath(character varying) OWNER TO trader1;

--
-- Name: install_jar(character varying, character varying, boolean); Type: FUNCTION; Schema: sqlj; Owner: trader1
--

CREATE FUNCTION install_jar(character varying, character varying, boolean) RETURNS void
    LANGUAGE java SECURITY DEFINER
    AS $$org.postgresql.pljava.management.Commands.installJar$$;


ALTER FUNCTION sqlj.install_jar(character varying, character varying, boolean) OWNER TO trader1;

--
-- Name: install_jar(bytea, character varying, boolean); Type: FUNCTION; Schema: sqlj; Owner: trader1
--

CREATE FUNCTION install_jar(bytea, character varying, boolean) RETURNS void
    LANGUAGE java SECURITY DEFINER
    AS $$org.postgresql.pljava.management.Commands.installJar$$;


ALTER FUNCTION sqlj.install_jar(bytea, character varying, boolean) OWNER TO trader1;

--
-- Name: remove_jar(character varying, boolean); Type: FUNCTION; Schema: sqlj; Owner: trader1
--

CREATE FUNCTION remove_jar(character varying, boolean) RETURNS void
    LANGUAGE java SECURITY DEFINER
    AS $$org.postgresql.pljava.management.Commands.removeJar$$;


ALTER FUNCTION sqlj.remove_jar(character varying, boolean) OWNER TO trader1;

--
-- Name: replace_jar(character varying, character varying, boolean); Type: FUNCTION; Schema: sqlj; Owner: trader1
--

CREATE FUNCTION replace_jar(character varying, character varying, boolean) RETURNS void
    LANGUAGE java SECURITY DEFINER
    AS $$org.postgresql.pljava.management.Commands.replaceJar$$;


ALTER FUNCTION sqlj.replace_jar(character varying, character varying, boolean) OWNER TO trader1;

--
-- Name: replace_jar(bytea, character varying, boolean); Type: FUNCTION; Schema: sqlj; Owner: trader1
--

CREATE FUNCTION replace_jar(bytea, character varying, boolean) RETURNS void
    LANGUAGE java SECURITY DEFINER
    AS $$org.postgresql.pljava.management.Commands.replaceJar$$;


ALTER FUNCTION sqlj.replace_jar(bytea, character varying, boolean) OWNER TO trader1;

--
-- Name: set_classpath(character varying, character varying); Type: FUNCTION; Schema: sqlj; Owner: trader1
--

CREATE FUNCTION set_classpath(character varying, character varying) RETURNS void
    LANGUAGE java SECURITY DEFINER
    AS $$org.postgresql.pljava.management.Commands.setClassPath$$;


ALTER FUNCTION sqlj.set_classpath(character varying, character varying) OWNER TO trader1;

SET search_path = javatest, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: employees1; Type: TABLE; Schema: javatest; Owner: trader1; Tablespace: 
--

CREATE TABLE employees1 (
    id integer NOT NULL,
    name character varying(200),
    salary integer
);


ALTER TABLE javatest.employees1 OWNER TO trader1;

--
-- Name: employees2; Type: TABLE; Schema: javatest; Owner: trader1; Tablespace: 
--

CREATE TABLE employees2 (
    id integer NOT NULL,
    name character varying(200),
    salary integer,
    transferday date,
    transfertime time without time zone
);


ALTER TABLE javatest.employees2 OWNER TO trader1;

--
-- Name: mdt; Type: TABLE; Schema: javatest; Owner: trader1; Tablespace: 
--

CREATE TABLE mdt (
    id integer,
    idesc text,
    moddate timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE javatest.mdt OWNER TO trader1;

SET default_with_oids = true;

--
-- Name: username_test; Type: TABLE; Schema: javatest; Owner: trader1; Tablespace: 
--

CREATE TABLE username_test (
    name text,
    username text NOT NULL
);


ALTER TABLE javatest.username_test OWNER TO trader1;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- Name: futurescontractdetails; Type: TABLE; Schema: public; Owner: trader1; Tablespace: 
--

CREATE TABLE futurescontractdetails (
    symbol character varying(8) NOT NULL,
    expiry integer NOT NULL,
    multiplier integer NOT NULL,
    pricemagnifier integer NOT NULL,
    exchange character varying(8) NOT NULL,
    mintick numeric NOT NULL,
    begindate date DEFAULT '1900-01-01'::date NOT NULL,
    enddate date DEFAULT '1900-01-01'::date NOT NULL,
    active bit(1) DEFAULT B'0'::"bit" NOT NULL,
    fullname character varying(56) NOT NULL
);


ALTER TABLE public.futurescontractdetails OWNER TO trader1;

--
-- Name: ibcard; Type: TABLE; Schema: public; Owner: trader1; Tablespace: 
--

CREATE TABLE ibcard (
    num integer NOT NULL,
    code character varying(4) NOT NULL
);


ALTER TABLE public.ibcard OWNER TO trader1;

--
-- Name: paperorders_idx_seq; Type: SEQUENCE; Schema: public; Owner: trader1
--

CREATE SEQUENCE paperorders_idx_seq
    START WITH 7
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 0
    CACHE 1;


ALTER TABLE public.paperorders_idx_seq OWNER TO trader1;

--
-- Name: paperorders; Type: TABLE; Schema: public; Owner: trader1; Tablespace: 
--

CREATE TABLE paperorders (
    idx integer DEFAULT nextval('paperorders_idx_seq'::regclass) NOT NULL,
    ul character varying(12) NOT NULL,
    ordertype paperordertype NOT NULL,
    price numeric DEFAULT (0)::numeric NOT NULL,
    translatedprice numeric DEFAULT (0)::numeric NOT NULL,
    bartime timestamp without time zone NOT NULL,
    lossorgain numeric DEFAULT (0)::numeric NOT NULL,
    orderid integer NOT NULL,
    parentid integer,
    entrytimestamp timestamp without time zone NOT NULL
);


ALTER TABLE public.paperorders OWNER TO trader1;

--
-- Name: paperorders-orig; Type: TABLE; Schema: public; Owner: trader1; Tablespace: 
--

CREATE TABLE "paperorders-orig" (
    idx integer DEFAULT nextval('paperorders_idx_seq'::regclass) NOT NULL,
    ul character varying(12) NOT NULL,
    expiry integer NOT NULL,
    buysell character varying(8) NOT NULL,
    totalquantity integer DEFAULT 0 NOT NULL,
    filledquantity integer DEFAULT 0 NOT NULL,
    remainingquantity integer DEFAULT 0,
    limitprice numeric DEFAULT 0::numeric NOT NULL,
    auxprice numeric DEFAULT 0::numeric NOT NULL,
    avgfillprice numeric DEFAULT 0::numeric NOT NULL,
    ordertype character varying(8) NOT NULL,
    tif character varying(8) NOT NULL,
    translatedprice numeric NOT NULL,
    bartime timestamp without time zone NOT NULL,
    lossorgain numeric,
    ocagroup character varying(24) DEFAULT NULL::character varying,
    ocatype smallint DEFAULT 2::smallint,
    orderid integer NOT NULL,
    parentid integer,
    permid integer,
    entrytimestamp timestamp without time zone NOT NULL,
    executedtimestamp timestamp without time zone,
    status status DEFAULT 'PendingSubmit'::status NOT NULL
);


ALTER TABLE public."paperorders-orig" OWNER TO trader1;

--
-- Name: papertrades_id_seq; Type: SEQUENCE; Schema: public; Owner: trader1
--

CREATE SEQUENCE papertrades_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 0
    CACHE 1;


ALTER TABLE public.papertrades_id_seq OWNER TO trader1;

--
-- Name: papertrades; Type: TABLE; Schema: public; Owner: trader1; Tablespace: 
--

CREATE TABLE papertrades (
    id integer DEFAULT nextval('papertrades_id_seq'::regclass) NOT NULL,
    enteredindb timestamp without time zone DEFAULT now() NOT NULL,
    begintradedatetime timestamp without time zone NOT NULL,
    symbol character varying(12) NOT NULL,
    "position" buysellpos NOT NULL,
    entry numeric NOT NULL,
    stoploss numeric NOT NULL,
    stoprisk numeric NOT NULL,
    stopprofit numeric NOT NULL,
    profitpotential numeric NOT NULL,
    outcome numeric NOT NULL,
    exittradedatetime timestamp without time zone NOT NULL
);


ALTER TABLE public.papertrades OWNER TO trader1;

--
-- Name: qtest; Type: TABLE; Schema: public; Owner: trader1; Tablespace: 
--

CREATE TABLE qtest (
    symbol character varying(15),
    expiry integer,
    datetime timestamp without time zone,
    open numeric,
    high numeric,
    low numeric,
    close numeric,
    volume bigint,
    weeknumber integer
);


ALTER TABLE public.qtest OWNER TO trader1;

--
-- Name: quotes1min; Type: TABLE; Schema: public; Owner: trader1; Tablespace: 
--

CREATE TABLE quotes1min (
    symbol character varying(15) NOT NULL,
    expiry integer NOT NULL,
    datetime timestamp without time zone NOT NULL,
    open numeric NOT NULL,
    high numeric NOT NULL,
    low numeric NOT NULL,
    close numeric NOT NULL,
    volume bigint NOT NULL
);


ALTER TABLE public.quotes1min OWNER TO trader1;

--
-- Name: quotes1mininterestrates; Type: TABLE; Schema: public; Owner: trader1; Tablespace: 
--

CREATE TABLE quotes1mininterestrates (
    symbol character varying(15) NOT NULL,
    expiry integer NOT NULL,
    datetime timestamp without time zone NOT NULL,
    open numeric NOT NULL,
    high numeric NOT NULL,
    low numeric NOT NULL,
    close numeric NOT NULL,
    volume bigint NOT NULL
);


ALTER TABLE public.quotes1mininterestrates OWNER TO trader1;

--
-- Name: test; Type: TABLE; Schema: public; Owner: trader1; Tablespace: 
--

CREATE TABLE test (
    col text
);


ALTER TABLE public.test OWNER TO trader1;

--
-- Name: trades; Type: TABLE; Schema: public; Owner: trader1; Tablespace: 
--

CREATE TABLE trades (
    ul character varying(12) NOT NULL,
    expiry integer NOT NULL,
    buysell character varying(8) NOT NULL,
    quantity integer NOT NULL,
    price numeric NOT NULL,
    type character varying(8) NOT NULL,
    tif character varying(8) NOT NULL,
    translatedprice numeric NOT NULL,
    bartime timestamp without time zone NOT NULL,
    lossorgain numeric,
    ocagroup character varying(24) DEFAULT NULL::character varying,
    orderid integer NOT NULL,
    parentid integer,
    permid integer,
    entrydatetime timestamp without time zone NOT NULL
);


ALTER TABLE public.trades OWNER TO trader1;

--
-- Name: tradesandresults; Type: TABLE; Schema: public; Owner: trader1; Tablespace: 
--

CREATE TABLE tradesandresults (
    indatetime timestamp without time zone NOT NULL,
    symbol character varying(12) NOT NULL,
    "position" character varying(12) NOT NULL,
    entry numeric,
    stoploss numeric,
    stoprisk numeric,
    stopprofit numeric,
    profitpotential numeric,
    outcome numeric,
    outdatetime timestamp without time zone
);


ALTER TABLE public.tradesandresults OWNER TO trader1;

--
-- Name: tt; Type: TABLE; Schema: public; Owner: trader1; Tablespace: 
--

CREATE TABLE tt (
    date_part double precision
);


ALTER TABLE public.tt OWNER TO trader1;

SET search_path = sqlj, pg_catalog;

--
-- Name: classpath_entry; Type: TABLE; Schema: sqlj; Owner: trader1; Tablespace: 
--

CREATE TABLE classpath_entry (
    schemaname character varying(30) NOT NULL,
    ordinal smallint NOT NULL,
    jarid integer NOT NULL
);


ALTER TABLE sqlj.classpath_entry OWNER TO trader1;

--
-- Name: jar_entry; Type: TABLE; Schema: sqlj; Owner: trader1; Tablespace: 
--

CREATE TABLE jar_entry (
    entryid integer NOT NULL,
    entryname character varying(200) NOT NULL,
    jarid integer NOT NULL,
    entryimage bytea NOT NULL
);


ALTER TABLE sqlj.jar_entry OWNER TO trader1;

--
-- Name: jar_entry_entryid_seq; Type: SEQUENCE; Schema: sqlj; Owner: trader1
--

CREATE SEQUENCE jar_entry_entryid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE sqlj.jar_entry_entryid_seq OWNER TO trader1;

--
-- Name: jar_entry_entryid_seq; Type: SEQUENCE OWNED BY; Schema: sqlj; Owner: trader1
--

ALTER SEQUENCE jar_entry_entryid_seq OWNED BY jar_entry.entryid;


--
-- Name: jar_repository; Type: TABLE; Schema: sqlj; Owner: trader1; Tablespace: 
--

CREATE TABLE jar_repository (
    jarid integer NOT NULL,
    jarname character varying(100) NOT NULL,
    jarorigin character varying(500) NOT NULL,
    jarowner name NOT NULL,
    jarmanifest text,
    deploymentdesc integer
);


ALTER TABLE sqlj.jar_repository OWNER TO trader1;

--
-- Name: jar_repository_jarid_seq; Type: SEQUENCE; Schema: sqlj; Owner: trader1
--

CREATE SEQUENCE jar_repository_jarid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE sqlj.jar_repository_jarid_seq OWNER TO trader1;

--
-- Name: jar_repository_jarid_seq; Type: SEQUENCE OWNED BY; Schema: sqlj; Owner: trader1
--

ALTER SEQUENCE jar_repository_jarid_seq OWNED BY jar_repository.jarid;


--
-- Name: typemap_entry; Type: TABLE; Schema: sqlj; Owner: trader1; Tablespace: 
--

CREATE TABLE typemap_entry (
    mapid integer NOT NULL,
    javaname character varying(200) NOT NULL,
    sqlname name NOT NULL
);


ALTER TABLE sqlj.typemap_entry OWNER TO trader1;

--
-- Name: typemap_entry_mapid_seq; Type: SEQUENCE; Schema: sqlj; Owner: trader1
--

CREATE SEQUENCE typemap_entry_mapid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE sqlj.typemap_entry_mapid_seq OWNER TO trader1;

--
-- Name: typemap_entry_mapid_seq; Type: SEQUENCE OWNED BY; Schema: sqlj; Owner: trader1
--

ALTER SEQUENCE typemap_entry_mapid_seq OWNED BY typemap_entry.mapid;


--
-- Name: entryid; Type: DEFAULT; Schema: sqlj; Owner: trader1
--

ALTER TABLE jar_entry ALTER COLUMN entryid SET DEFAULT nextval('jar_entry_entryid_seq'::regclass);


--
-- Name: jarid; Type: DEFAULT; Schema: sqlj; Owner: trader1
--

ALTER TABLE jar_repository ALTER COLUMN jarid SET DEFAULT nextval('jar_repository_jarid_seq'::regclass);


--
-- Name: mapid; Type: DEFAULT; Schema: sqlj; Owner: trader1
--

ALTER TABLE typemap_entry ALTER COLUMN mapid SET DEFAULT nextval('typemap_entry_mapid_seq'::regclass);


SET search_path = javatest, pg_catalog;

--
-- Name: employees1_pkey; Type: CONSTRAINT; Schema: javatest; Owner: trader1; Tablespace: 
--

ALTER TABLE ONLY employees1
    ADD CONSTRAINT employees1_pkey PRIMARY KEY (id);


--
-- Name: employees2_pkey; Type: CONSTRAINT; Schema: javatest; Owner: trader1; Tablespace: 
--

ALTER TABLE ONLY employees2
    ADD CONSTRAINT employees2_pkey PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- Name: futurescontractdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: trader1; Tablespace: 
--

ALTER TABLE ONLY futurescontractdetails
    ADD CONSTRAINT futurescontractdetails_pkey PRIMARY KEY (symbol, expiry);


--
-- Name: ibcard_pkey; Type: CONSTRAINT; Schema: public; Owner: trader1; Tablespace: 
--

ALTER TABLE ONLY ibcard
    ADD CONSTRAINT ibcard_pkey PRIMARY KEY (num);


--
-- Name: paperorders_pkey; Type: CONSTRAINT; Schema: public; Owner: trader1; Tablespace: 
--

ALTER TABLE ONLY paperorders
    ADD CONSTRAINT paperorders_pkey PRIMARY KEY (idx);


--
-- Name: papertrades_pkey; Type: CONSTRAINT; Schema: public; Owner: trader1; Tablespace: 
--

ALTER TABLE ONLY papertrades
    ADD CONSTRAINT papertrades_pkey PRIMARY KEY (id);


--
-- Name: quotes1min_pkey; Type: CONSTRAINT; Schema: public; Owner: trader1; Tablespace: 
--

ALTER TABLE ONLY quotes1min
    ADD CONSTRAINT quotes1min_pkey PRIMARY KEY (symbol, datetime);


--
-- Name: quotes1mininterestrates_pkey; Type: CONSTRAINT; Schema: public; Owner: trader1; Tablespace: 
--

ALTER TABLE ONLY quotes1mininterestrates
    ADD CONSTRAINT quotes1mininterestrates_pkey PRIMARY KEY (symbol, datetime);


--
-- Name: trades_pkey; Type: CONSTRAINT; Schema: public; Owner: trader1; Tablespace: 
--

ALTER TABLE ONLY trades
    ADD CONSTRAINT trades_pkey PRIMARY KEY (ul, expiry, entrydatetime);


--
-- Name: tradesandresults_pkey; Type: CONSTRAINT; Schema: public; Owner: trader1; Tablespace: 
--

ALTER TABLE ONLY tradesandresults
    ADD CONSTRAINT tradesandresults_pkey PRIMARY KEY (indatetime, symbol);


SET search_path = sqlj, pg_catalog;

--
-- Name: classpath_entry_pkey; Type: CONSTRAINT; Schema: sqlj; Owner: trader1; Tablespace: 
--

ALTER TABLE ONLY classpath_entry
    ADD CONSTRAINT classpath_entry_pkey PRIMARY KEY (schemaname, ordinal);


--
-- Name: jar_entry_jarid_key; Type: CONSTRAINT; Schema: sqlj; Owner: trader1; Tablespace: 
--

ALTER TABLE ONLY jar_entry
    ADD CONSTRAINT jar_entry_jarid_key UNIQUE (jarid, entryname);


--
-- Name: jar_entry_pkey; Type: CONSTRAINT; Schema: sqlj; Owner: trader1; Tablespace: 
--

ALTER TABLE ONLY jar_entry
    ADD CONSTRAINT jar_entry_pkey PRIMARY KEY (entryid);


--
-- Name: jar_repository_jarname_key; Type: CONSTRAINT; Schema: sqlj; Owner: trader1; Tablespace: 
--

ALTER TABLE ONLY jar_repository
    ADD CONSTRAINT jar_repository_jarname_key UNIQUE (jarname);


--
-- Name: jar_repository_pkey; Type: CONSTRAINT; Schema: sqlj; Owner: trader1; Tablespace: 
--

ALTER TABLE ONLY jar_repository
    ADD CONSTRAINT jar_repository_pkey PRIMARY KEY (jarid);


--
-- Name: typemap_entry_pkey; Type: CONSTRAINT; Schema: sqlj; Owner: trader1; Tablespace: 
--

ALTER TABLE ONLY typemap_entry
    ADD CONSTRAINT typemap_entry_pkey PRIMARY KEY (mapid);


SET search_path = public, pg_catalog;

--
-- Name: Primary key; Type: INDEX; Schema: public; Owner: trader1; Tablespace: 
--

CREATE UNIQUE INDEX "Primary key" ON qtest USING btree (symbol, datetime);


--
-- Name: replace_qtest; Type: RULE; Schema: public; Owner: trader1
--

CREATE RULE replace_qtest AS ON INSERT TO qtest WHERE (EXISTS (SELECT 1 FROM qtest WHERE (((qtest.symbol)::text = (new.symbol)::text) AND (qtest.datetime = new.datetime)))) DO INSTEAD UPDATE qtest SET expiry = new.expiry, open = new.open, high = new.high, low = new.low, close = new.close, volume = new.volume WHERE (((qtest.symbol)::text = (new.symbol)::text) AND (qtest.datetime = new.datetime));


--
-- Name: replace_quotes1min; Type: RULE; Schema: public; Owner: trader1
--

CREATE RULE replace_quotes1min AS ON INSERT TO quotes1min WHERE (EXISTS (SELECT 1 FROM quotes1min WHERE (((quotes1min.symbol)::text = (new.symbol)::text) AND (quotes1min.datetime = new.datetime)))) DO INSTEAD UPDATE quotes1min SET expiry = new.expiry, open = new.open, high = new.high, low = new.low, close = new.close, volume = new.volume WHERE (((quotes1min.symbol)::text = (new.symbol)::text) AND (quotes1min.datetime = new.datetime));


--
-- Name: replace_quotes1mininterestrates; Type: RULE; Schema: public; Owner: trader1
--

CREATE RULE replace_quotes1mininterestrates AS ON INSERT TO quotes1min WHERE (EXISTS (SELECT 1 FROM quotes1min WHERE (((quotes1min.symbol)::text = (new.symbol)::text) AND (quotes1min.datetime = new.datetime)))) DO INSTEAD UPDATE quotes1min SET expiry = new.expiry, open = new.open, high = new.high, low = new.low, close = new.close, volume = new.volume WHERE (((quotes1min.symbol)::text = (new.symbol)::text) AND (quotes1min.datetime = new.datetime));


SET search_path = javatest, pg_catalog;

--
-- Name: after_insert_usernames; Type: TRIGGER; Schema: javatest; Owner: trader1
--

CREATE TRIGGER after_insert_usernames
    AFTER INSERT ON username_test
    FOR EACH ROW
    EXECUTE PROCEDURE after_username_insert('username');


--
-- Name: after_username_updates; Type: TRIGGER; Schema: javatest; Owner: trader1
--

CREATE TRIGGER after_username_updates
    AFTER UPDATE ON username_test
    FOR EACH ROW
    EXECUTE PROCEDURE after_username_update('username');


--
-- Name: insert_usernames; Type: TRIGGER; Schema: javatest; Owner: trader1
--

CREATE TRIGGER insert_usernames
    BEFORE INSERT OR UPDATE ON username_test
    FOR EACH ROW
    EXECUTE PROCEDURE insert_username('username');


--
-- Name: mdt_moddatetime; Type: TRIGGER; Schema: javatest; Owner: trader1
--

CREATE TRIGGER mdt_moddatetime
    BEFORE UPDATE ON mdt
    FOR EACH ROW
    EXECUTE PROCEDURE moddatetime('moddate');


--
-- Name: username_leak; Type: TRIGGER; Schema: javatest; Owner: trader1
--

CREATE TRIGGER username_leak
    BEFORE UPDATE ON username_test
    FOR EACH ROW
    EXECUTE PROCEDURE leak_statements();


SET search_path = sqlj, pg_catalog;

--
-- Name: classpath_entry_jarid_fkey; Type: FK CONSTRAINT; Schema: sqlj; Owner: trader1
--

ALTER TABLE ONLY classpath_entry
    ADD CONSTRAINT classpath_entry_jarid_fkey FOREIGN KEY (jarid) REFERENCES jar_repository(jarid) ON DELETE CASCADE;


--
-- Name: jar_entry_jarid_fkey; Type: FK CONSTRAINT; Schema: sqlj; Owner: trader1
--

ALTER TABLE ONLY jar_entry
    ADD CONSTRAINT jar_entry_jarid_fkey FOREIGN KEY (jarid) REFERENCES jar_repository(jarid) ON DELETE CASCADE;


--
-- Name: jar_repository_deploymentdesc_fkey; Type: FK CONSTRAINT; Schema: sqlj; Owner: trader1
--

ALTER TABLE ONLY jar_repository
    ADD CONSTRAINT jar_repository_deploymentdesc_fkey FOREIGN KEY (deploymentdesc) REFERENCES jar_entry(entryid) ON DELETE SET NULL;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: sqlj; Type: ACL; Schema: -; Owner: trader1
--

REVOKE ALL ON SCHEMA sqlj FROM PUBLIC;
REVOKE ALL ON SCHEMA sqlj FROM trader1;
GRANT ALL ON SCHEMA sqlj TO trader1;
GRANT USAGE ON SCHEMA sqlj TO PUBLIC;


SET search_path = public, pg_catalog;

--
-- Name: datedrangebysymbol(character varying, timestamp without time zone, timestamp without time zone); Type: ACL; Schema: public; Owner: trader1
--

REVOKE ALL ON FUNCTION datedrangebysymbol(character varying, timestamp without time zone, timestamp without time zone) FROM PUBLIC;
REVOKE ALL ON FUNCTION datedrangebysymbol(character varying, timestamp without time zone, timestamp without time zone) FROM trader1;
GRANT ALL ON FUNCTION datedrangebysymbol(character varying, timestamp without time zone, timestamp without time zone) TO trader1;
GRANT ALL ON FUNCTION datedrangebysymbol(character varying, timestamp without time zone, timestamp without time zone) TO PUBLIC;
GRANT ALL ON FUNCTION datedrangebysymbol(character varying, timestamp without time zone, timestamp without time zone) TO "testRole" WITH GRANT OPTION;


--
-- Name: distinctquotesymbols(); Type: ACL; Schema: public; Owner: trader1
--

REVOKE ALL ON FUNCTION distinctquotesymbols() FROM PUBLIC;
REVOKE ALL ON FUNCTION distinctquotesymbols() FROM trader1;
GRANT ALL ON FUNCTION distinctquotesymbols() TO trader1;
GRANT ALL ON FUNCTION distinctquotesymbols() TO PUBLIC;
GRANT ALL ON FUNCTION distinctquotesymbols() TO "testRole" WITH GRANT OPTION;


--
-- Name: install_rcmd(text); Type: ACL; Schema: public; Owner: trader1
--

REVOKE ALL ON FUNCTION install_rcmd(text) FROM PUBLIC;
REVOKE ALL ON FUNCTION install_rcmd(text) FROM trader1;
GRANT ALL ON FUNCTION install_rcmd(text) TO trader1;


--
-- Name: plr_environ(); Type: ACL; Schema: public; Owner: trader1
--

REVOKE ALL ON FUNCTION plr_environ() FROM PUBLIC;
REVOKE ALL ON FUNCTION plr_environ() FROM trader1;
GRANT ALL ON FUNCTION plr_environ() TO trader1;


--
-- Name: plr_set_display(text); Type: ACL; Schema: public; Owner: trader1
--

REVOKE ALL ON FUNCTION plr_set_display(text) FROM PUBLIC;
REVOKE ALL ON FUNCTION plr_set_display(text) FROM trader1;
GRANT ALL ON FUNCTION plr_set_display(text) TO trader1;


--
-- Name: plr_set_rhome(text); Type: ACL; Schema: public; Owner: trader1
--

REVOKE ALL ON FUNCTION plr_set_rhome(text) FROM PUBLIC;
REVOKE ALL ON FUNCTION plr_set_rhome(text) FROM trader1;
GRANT ALL ON FUNCTION plr_set_rhome(text) TO trader1;


--
-- Name: plr_unset_rhome(); Type: ACL; Schema: public; Owner: trader1
--

REVOKE ALL ON FUNCTION plr_unset_rhome() FROM PUBLIC;
REVOKE ALL ON FUNCTION plr_unset_rhome() FROM trader1;
GRANT ALL ON FUNCTION plr_unset_rhome() TO trader1;


SET search_path = sqlj, pg_catalog;

--
-- Name: classpath_entry; Type: ACL; Schema: sqlj; Owner: trader1
--

REVOKE ALL ON TABLE classpath_entry FROM PUBLIC;
REVOKE ALL ON TABLE classpath_entry FROM trader1;
GRANT ALL ON TABLE classpath_entry TO trader1;
GRANT SELECT ON TABLE classpath_entry TO PUBLIC;


--
-- Name: jar_entry; Type: ACL; Schema: sqlj; Owner: trader1
--

REVOKE ALL ON TABLE jar_entry FROM PUBLIC;
REVOKE ALL ON TABLE jar_entry FROM trader1;
GRANT ALL ON TABLE jar_entry TO trader1;
GRANT SELECT ON TABLE jar_entry TO PUBLIC;


--
-- Name: jar_repository; Type: ACL; Schema: sqlj; Owner: trader1
--

REVOKE ALL ON TABLE jar_repository FROM PUBLIC;
REVOKE ALL ON TABLE jar_repository FROM trader1;
GRANT ALL ON TABLE jar_repository TO trader1;
GRANT SELECT ON TABLE jar_repository TO PUBLIC;


--
-- Name: typemap_entry; Type: ACL; Schema: sqlj; Owner: trader1
--

REVOKE ALL ON TABLE typemap_entry FROM PUBLIC;
REVOKE ALL ON TABLE typemap_entry FROM trader1;
GRANT ALL ON TABLE typemap_entry TO trader1;
GRANT SELECT ON TABLE typemap_entry TO PUBLIC;


--
-- PostgreSQL database dump complete
--

