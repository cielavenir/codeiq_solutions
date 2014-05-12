<?php
$a=[97,65,12354,12450,12450,12354,65,97];for($i=0;$i<26;$i++){$e=array_map(function($e)use($i){return mb_convert_encoding('&#'.($e+$i).';','UTF-8','HTML-ENTITIES');},$a);echo join($e);}