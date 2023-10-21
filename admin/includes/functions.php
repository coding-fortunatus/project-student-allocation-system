<?php 

function validate_input($data) {
    stripslashes($data);
    htmlspecialchars($data);
    trim($data);
    return $data;
}

function getLecturers(){
    global $conn;
    $sql = "SELECT * FROM lecturers";
    $lecturers = mysqli_query($conn, $sql);
    return $lecturers;
}

function getStudents($data){
    global $conn;
    $sql = "SELECT * FROM students WHERE programme = '$data'";
    $students = mysqli_query($conn, $sql);
    return $students;
}

function HndSupervisors($statuses, $lecturers) {
    $extracted_lecturers = array();
    foreach($lecturers as $lec) {
        if (in_array($lec['lec_status'], $statuses)) {
            array_push($extracted_lecturers, $lec['id']);
        }
    }
    return $extracted_lecturers;
}

function make_allocation($studentsArray, $lecturerArray) {
    
    $studentsPerLecturer = floor(count($studentsArray) / count($lecturerArray));
    $remainingStudents = (count($studentsArray) % count($lecturerArray));
    shuffle($studentsArray);
    $lecturerAllocationArray = array();
    foreach($lecturerArray as $lecturer) {
        $allocatedStudents = array_splice($studentsArray, 0, $studentsPerLecturer);
        
        // Store the allocation as associative array
        $allocationSubArray = array(
            "Lecturer" => $lecturer,
            "Students" => $allocatedStudents
        );
        
        // Store all the data into another array
        $lecturerAllocationArray[] = $allocationSubArray;
    }
    
    // allocate the remaining students from the student array after the general allocation
    for ($i=0; $i < $remainingStudents; $i++) { 
        array_push($lecturerAllocationArray[$i]['Students'], $studentsArray[$i]);
    }
    return $lecturerAllocationArray;
}

function getAllocations($allocation_table, $lecturer_table){
    global $conn;
    // Fetch the allocation from the database if allocation has been done
    $query = 
            "SELECT $allocation_table.id, $lecturer_table.lecturer_name, $lecturer_table.lecturer_code, $lecturer_table.lec_status, $allocation_table.students, $allocation_table.programme
            FROM $allocation_table
            INNER JOIN $lecturer_table ON $allocation_table.supervisor_id = $lecturer_table.id";
    $allocation = mysqli_query($conn, $query);
    return $allocation;
}

function uploadAllocations($table, $students, $lec, $programme) {
    global $conn;
    // Check if the user data already exists in the database
    $query = "SELECT * FROM $table WHERE supervisor_id = '$lec'";
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) > 0) {
        $updateQuery = "UPDATE $table SET students = '$students' WHERE supervisor_id = '$lec'";
        if (mysqli_query($conn, $updateQuery)) {
            $msg = "Student allocation updated successfully";
            return $msg;
        } else {
            $failmsg = "Oops, an error occur while updating student allocation";
            return $failmsg;
        }
    } else {
        
        // Insert data into the database if not exists
        $sql = "INSERT INTO $table(supervisor_id, students, programme)VALUES('$lec', '$students', '$programme')";
        if (mysqli_query($conn, $sql)) {
            $msg = "Student allocation successfully generated!";
            return $msg;
        } else {
            $failmsg = "Oops, an error occured while generating allocation";
            return $failmsg;
        }
    }
    
}
?>