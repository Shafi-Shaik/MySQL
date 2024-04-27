

## The Query :
```
SELECT 
       'shafi123' AS str,
	CHAR_LENGTH('shafi123') AS Ch_len,
	BIT_LENGTH('shafi123') AS BIT_LENGTH,
	CONCAT('$- ', 'shafi123') AS concat,
	CONCAT_WS(' $ ', 'shafi', 'shaik', '123') AS CONCAT_WS,
	ELT(4, 's', 'h', 'a', 'f', 'i') AS ELT,
	INSTR('h', 'shafi23') AS instr,
	LOCATE('h', 'shafi23') AS locate,
	FIND_IN_SET('a', 's,h,a,f,i23') AS find_in_set,

	LCASE('SHAFI') AS lcase,
	UCASE('shafi') AS ucase,

	INSERT('Quadratic', 3, 1, '123') AS inser_t,

	LEFT('shafi123', 3) AS lef_t,
	RIGHT('shafi123', 3) AS righ_t,
	MID('shafi123', 5, 2) AS mid,


	LPAD('shafi23', 11, '?') AS lpad,
	RPAD('shafi23', 11, '?') AS rpad,
	TRIM('    shafi  ') AS trm,

	REPEAT('fi ', 3) AS repea_t,
	REPLACE('shafi', 'af', 'wadf') AS replac_e,
	REVERSE('shafi123') AS revers_e,

	SUBSTRING_INDEX('www.mysql.com', '.', 2) AS substr_ind,

	SUBSTR('shafi123', 3) AS substr1,
	SUBSTR('shafi123', 3, 4) AS substr2,
	SUBSTR('shafi123', - 4, 2) AS substr3,

	CONCAT('shafi', SPACE(5), 'shafi') AS spacee

FROM DUAL -- this is required in some RDBMS such as Oracle


```

## The Result :
<html>
<head>
</head>
<body>
<table border=1>
<tr>
<td bgcolor=silver class='medium'>str</td>
<td bgcolor=silver class='medium'>Ch_len</td>
<td bgcolor=silver class='medium'>BIT_LENGTH</td>
<td bgcolor=silver class='medium'>concat</td>
<td bgcolor=silver class='medium'>CONCAT_WS</td>
<td bgcolor=silver class='medium'>ELT</td>
<td bgcolor=silver class='medium'>instr</td>
<td bgcolor=silver class='medium'>locate</td>
<td bgcolor=silver class='medium'>find_in_set</td>
<td bgcolor=silver class='medium'>lcase</td>
<td bgcolor=silver class='medium'>ucase</td>
<td bgcolor=silver class='medium'>inser_t</td>
<td bgcolor=silver class='medium'>lef_t</td>
<td bgcolor=silver class='medium'>righ_t</td>
<td bgcolor=silver class='medium'>mid</td>
<td bgcolor=silver class='medium'>lpad</td>
<td bgcolor=silver class='medium'>rpad</td>
<td bgcolor=silver class='medium'>trm</td>
<td bgcolor=silver class='medium'>repea_t</td>
<td bgcolor=silver class='medium'>replac_e</td>
<td bgcolor=silver class='medium'>revers_e</td>
<td bgcolor=silver class='medium'>substr_ind</td>
<td bgcolor=silver class='medium'>substr1</td>
<td bgcolor=silver class='medium'>substr2</td>
<td bgcolor=silver class='medium'>substr3</td>
<td bgcolor=silver class='medium'>space</td>
</tr>

<tr>
<td class='normal' valign='top'>shafi123</td>
<td class='normal' valign='top'>8</td>
<td class='normal' valign='top'>64</td>
<td class='normal' valign='top'>$- shafi123</td>
<td class='normal' valign='top'>shafi $ shaik $ 123</td>
<td class='normal' valign='top'>f</td>
<td class='normal' valign='top'>0</td>
<td class='normal' valign='top'>2</td>
<td class='normal' valign='top'>3</td>
<td class='normal' valign='top'>shafi</td>
<td class='normal' valign='top'>SHAFI</td>
<td class='normal' valign='top'>Qu123dratic</td>
<td class='normal' valign='top'>sha</td>
<td class='normal' valign='top'>123</td>
<td class='normal' valign='top'>i1</td>
<td class='normal' valign='top'>????shafi23</td>
<td class='normal' valign='top'>shafi23????</td>
<td class='normal' valign='top'>shafi</td>
<td class='normal' valign='top'>fi fi fi </td>
<td class='normal' valign='top'>shwadfi</td>
<td class='normal' valign='top'>321ifahs</td>
<td class='normal' valign='top'>www.mysql</td>
<td class='normal' valign='top'>afi123</td>
<td class='normal' valign='top'>afi1</td>
<td class='normal' valign='top'>i1</td>
<td class='normal' valign='top'>shafi     shafi</td>
</tr>
</table>
</body></html>






![Pic of String Function](https://raw.githubusercontent.com/Shafi-Shaik/MySQL/ad063e1088dbdc851ead47baad8b5cb8f892e5f4/MySQL%20String%20Functions%20.png)



