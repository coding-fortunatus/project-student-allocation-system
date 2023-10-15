<?php 

function validate_input($data) {
    stripslashes($data);
    htmlspecialchars($data);
    trim($data);
    return $data;
}

function getLecturers(){
    global $conn;
    $sql = "SELECT * FROM lecturers ORDER BY lecturer_name";
    $result = mysqli_query($conn, $sql);
    return $result;
}

function getStudents(){
    global $conn;
    $sql = "SELECT * FROM students ORDER BY matric_number";
    $result = mysqli_query($conn, $sql);
    return $result;
}


?>