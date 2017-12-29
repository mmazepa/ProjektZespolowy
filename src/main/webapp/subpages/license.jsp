<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Editor On-Line</title>
		<meta type="text/html" charset="UTF-8" language="java" />
		<link type="text/css" rel="stylesheet" href="../static/css/main.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="../static/javascript/main.js"></script>
	</head>
	<body onload="loadHeaderAndFooter()">
    <header id="header"></header>
    <main id="indexMain" class="license">
      <div class="centeredText">
        <br/>
        <table class="adminTable licenseTable">
          <tr>
            <th>License</th>
            <th>Product</th>
            <th>Copyright</th>
          </tr>
          <tr>
            <td rowspan="4">Massachusetts Institute of Technology (MIT) License</td>
          </tr>
          <tr>
            <td>CodeMirror</td>
            <td>
              Copyright (C) 2017 by Marijn Haverbeke
              &lt;<a href="mailto:marijnh@gmail.com">marijnh@gmail.com</a>&gt;
              and others
            </td>
          </tr>
          <tr>
            <td>AngularJS</td>
            <td>
              Copyright (c) 2010-2017 Google, Inc.
              <a href="http://angularjs.org">angularjs.org</a>
            </td>
          </tr>
          <tr>
            <td>Bootstrap</td>
            <td>Copyright (c) 2011-2016 Twitter, Inc.</td>
          </tr>
          <tr>
            <td>CC BY-SA 3.0 License</td>
            <td>Used images</td>
            <td>
              Toptal, Subbtle Patterns,
              <a href="https://www.toptal.com/designers/subtlepatterns">
                www.subtlepatterns.com
              </a>
            </td>
          </tr>
        </table>
        <nav class="licenseText">
          <h3>MIT License</h3>
          <p>
            Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
            documentation files (the "Software"), to deal in the Software without restriction, including without limitation
            the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
            and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
          </p>
          <p>
            The above copyright notice and this permission notice shall be included in all copies or substantial portions
            of the Software.
          </p>
          <p>
            THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
            TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
            THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
            OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
            DEALINGS IN THE SOFTWARE.
          </p>
        </nav>
        <a id="backLink" href="../index.jsp">
          <span class="glyphicon glyphicon-arrow-left"></span> Back
        </a>
      </div>
    </main>
    <footer></footer>
	</body>
</html>
