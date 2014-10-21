#!/bin/bash



TARGET=${1:?}


cat <<EOC
<!DOCTYPE html>
<html>
  <head>
    <title>5R</title>
    <style type="text/css">
      ul {
        width: 1300px;
        list-style: none;
      }
      li {
        float: left;
        margin-right: 20px;
      }
      body {
        font-weight: bold;
      }
    </style>
  </head>
  <body>

    <h3>MRTG Index Page</h1>
    <ul>
EOC


for file in $(ls -v ${TARGET}*.html); do BASE=$(basename $file .html); echo "<li>$(grep '<title' $file | head -1 | sed  's/<title>//' | sed 's/<\/title>//' | tr -d '\t')<br /><a href=\"${BASE}.html\"><img src=\"${BASE}-day.png\" alt=\"${BASE}-day\"/></a></li>" ; done

