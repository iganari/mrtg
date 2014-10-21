#!/bin/bash

cat <<EOC>index_new.html
<!DOCTYPE html>
<html>
  <head>
    <title>2R</title>
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


for file in $(ls *.html); do BASE=$(basename $file .html); echo "<li>${BASE} (192.168.XXX.XXX)<br /><a href=\"${BASE}.html\"><img src=\"${BASE}-day.png\" alt=\"${BASE}-day\"/></a></li>" >>index_new.html; done

