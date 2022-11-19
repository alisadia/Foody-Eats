

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
if(isset($_POST["submit"]))
{
    $fullname=$_POST["fullname"];
    $email=$_POST["email"];
    $message=$_POST["sendmessage"];
    $sql_query="INSERT INTO contact(fullname,email,sendmessage) values('$fullname','$email','$message')";
    if(mysqli_query($conn,$sql_query))
    {
         echo " Feedback sucessfull";
    }
    else
    {
     echo " Error:".$sql."".mysqli_error($conn);
    }
   
   mysqli_close($conn);
}
?>