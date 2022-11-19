<?php

   $servername="localhost";
   $username="root";
   $password="";
   $database="food delivery";
   
   // database conection
   $conn=new mysqli($servername,$username,$password,$database);
   if(!$conn)
   {
       die("Connection failed: " .mysqli_connect_error());
   }
 if(isset($_POST["save"]))
   {
       $fullname=$_POST["fullname"];
       $email=$_POST["email"];
       $address=$_POST["address"];
       $city=$_POST["city"];
       $quantity=$_POST["quantity"];
       $accountnumber=$_POST["accountnumber"];
       $cardcvc=$_POST["cardcvc"];
      
         $sql_query="INSERT INTO payment(fullname,email,adress,city,quantity,account,cardcvc) 
       values('$fullname','$email','$address','$city','$quantity','$accountnumber','$cardcvc')";
       
        mysqli_query($conn,$sql_query);
        echo "<span> Congratulations!! Payment Sucesfull. We will try to send your order soon. Thank You</span>";
    
      mysqli_close($conn);
   }
?>