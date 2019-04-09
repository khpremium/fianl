<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
    <head>
    <title>lightSlider Demo</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <link rel="stylesheet"  href="SHINnara/css/lightslider.css">
     
    <style>
    	ul{
			list-style: none outside none;
		    padding-left: 20%;
		    margin: auto;
            
		}
        .demo .item{
            margin-bottom: 60px;
        }
		.content-slider li{
		    background-color: #ed3020;
		    text-align: center;
		    color: #FFF;
		}
		.content-slider h3 {
		    margin: 0;
		    padding: 70px 0;
		}
		.demo{
			width: 800px;
		}
    </style>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="SHINnara/js/lightslider.js"></script>
    <script>
    	 $(document).ready(function() {
			$("#content-slider").lightSlider({
                loop:true,
                keyPress:true
            });
            $('#image-gallery').lightSlider({
                gallery:true,
                item:1,
                thumbItem:9,
                slideMargin: 0,
                speed:500,
                auto:true,
                loop:true,
                onSliderLoad: function() {
                    $('#image-gallery').removeClass('cS-hidden');
                }  
            });
            
		});
    </script>

</head>
<body>
	<div class="demo">
        <div class="item">            
           
            <div class="clearfix" style="max-width: 1500px; height: auto;">
                <ul id="image-gallery" class="gallery list-unstyled cS-hidden" style="height: auto !important;">
                    <c:forEach items="${files}" var="data">
                      <li data-thumb="SHINnara/images/${data}"> 
                        <img src="SHINnara/images/${data}"  style="width: auto; height: 400px;"/>
                       </li>
                    </c:forEach>
          <!--           <li data-thumb="SHINnara/images/thumb/cS-2.jpg"> 
                        <img src="SHINnara/images/cS-2.jpg" />
                         </li>
                    <li data-thumb="SHINnara/images/thumb/cS-3.jpg"> 
                        <img src="SHINnara/images/cS-3.jpg" />
                         </li>
                    <li data-thumb="SHINnara/images/thumb/cS-4.jpg"> 
                        <img src="SHINnara/images/cS-4.jpg" />
                         </li> -->
                  <!--   <li data-thumb="image/thumb/cS-5.jpg"> 
                        <img src="image/cS-5.jpg" />
                         </li>
                    <li data-thumb="image/thumb/cS-6.jpg"> 
                        <img src="image/cS-6.jpg" />
                         </li>
                    <li data-thumb="image/thumb/cS-7.jpg"> 
                        <img src="image/cS-7.jpg" />
                         </li>
                    <li data-thumb="image/thumb/cS-8.jpg"> 
                        <img src="image/cS-8.jpg" />
                         </li>
                    <li data-thumb="image/thumb/cS-9.jpg"> 
                        <img src="image/cS-9.jpg" />
                         </li>
                    <li data-thumb="image/thumb/cS-10.jpg"> 
                        <img src="image/cS-10.jpg" />
                         </li>
                    <li data-thumb="image/thumb/cS-11.jpg"> 
                        <img src="image/cS-11.jpg" />
                         </li>
                    <li data-thumb="image/thumb/cS-12.jpg"> 
                        <img src="image/cS-12.jpg" />
                         </li>
                    <li data-thumb="image/thumb/cS-13.jpg"> 
                        <img src="image/cS-13.jpg" />
                         </li>
                    <li data-thumb="image/thumb/cS-14.jpg"> 
                        <img src="image/cS-14.jpg" />
                         </li>
                    <li data-thumb="image/thumb/cS-15.jpg"> 
                        <img src="image/cS-15.jpg" />
                         </li> -->
                   
                </ul>
            </div>
        </div>
    </div>	

</body>
