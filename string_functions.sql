SELECT 'shafi123' as str,
       CHAR_LENGTH('shafi123') as Ch_len,
       BIT_LENGTH('shafi123') as BIT_LENGTH,
       CONCAT('$- ','shafi123') as concat,
       CONCAT_WS(' $ ','shafi','shaik','123') as CONCAT_WS,
       ELT(4,'s','h','a','f','i') as ELT,
       INSTR('h','shafi23') as instr,
       LOCATE('h','shafi23') as locate,
       FIND_IN_SET('a','s,h,a,f,i23') as find_in_set,
       LCASE('SHAFI') as lcase,
       UCASE('shafi') as ucase,
       INSERT('Quadratic', 3, 1, '123') as inser_t,
       Left('shafi123',3) as lef_t,
       right('shafi123',3) as righ_t,
       mid('shafi123',5,2) as mid,
       lpad('shafi23',11,'?') as lpad,
       rpad('shafi23',11,'?') as rpad,
       trim('    shafi  ') as trm,
       repeat('fi ',3) as repea_t,
       replace('shafi','af','wadf') as replac_e,
       reverse('shafi123') as revers_e,
       SUBSTRING_INDEX('www.mysql.com', '.', 2) as substr_ind,
       substr('shafi123',3) as substr1,
       substr('shafi123',3,4) as substr2,
       substr('shafi123',-4,2) as substr3,
       concat('shafi',space(4),'4 spaces') as space
 /*
 Output:
str, Ch_len, BIT_LENGTH, concat, CONCAT_WS, ELT, instr, locate, find_in_set, lcase, ucase, inser_t, lef_t, righ_t, mid, lpad, rpad, trm, repea_t, replac_e, revers_e, substr_ind, substr1, substr2, substr3, space
'shafi123', '8', '64', '$- shafi123', 'shafi $ shaik $ 123', 'f', '0', '2', '3', 'shafi', 'SHAFI', 'Qu123dratic', 'sha', '123', 'i1', '????shafi23', 'shafi23????', 'shafi', 'fi fi fi ', 'shwadfi', '321ifahs', 'www.mysql', 'afi123', 'afi1', 'i1', 'shafi    4 spaces'
*/