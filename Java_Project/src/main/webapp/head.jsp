<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Note Taking App</title>
    <link rel="stylesheet" href="style_home.css">
    <link rel="stylesheet" href="styleheader.css">
</head>
<body>
  <script type="text/javascript">
        function fetchDataAndPopulateDivs() {
            fetch('Admin_Dashboard')
            .then(response => response.json())
            .then(data => {
                const body = document.body;

                data.forEach(item => {
                    const div = document.createElement('div');
                    div.classList.add('item');

                    const profileImg = document.createElement('img');
                    profileImg.src = 'data:image/jpeg;base64,' + item.ImageData3;
                    profileImg.alt = 'Profile Image';

                    const img = document.createElement('img');
                    img.src = 'data:image/jpeg;base64,' + item.imageData;
                    img.alt = 'Image';

                    const h5 = document.createElement('h5');
                    h5.classList.add('heading');
                    h5.textContent = ''; // Add your heading text here

                    const p = document.createElement('p');
                    p.textContent = item.content; // Add your content text here

                    div.appendChild(profileImg);
                    div.appendChild(img);
                    div.appendChild(h5);
                    div.appendChild(p);

                    body.appendChild(div);
                });
            })
            .catch(error => console.error('Error fetching data:', error));
        }

        window.addEventListener('load', fetchDataAndPopulateDivs);
    </script>
  <%@ include file="Header.jsp"%>
 