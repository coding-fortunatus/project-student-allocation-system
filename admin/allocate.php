<?php 
require_once './includes/header.php'; 
require_once './includes/functions.php';
global $conn;

$lecturerArray = $studentsArray = $msg = $failmsg = $message = "";

// """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
//  ND STUDENTS FUNCTIONALITIES
// """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

// extract matric_number from student data 
$NDstudents = getStudents("ND");
$lec_result = getLecturers();
$NDstudentsArray = array();
$NDlecturerArray = array();
// Check if the query to fetch ND student matric number was successful
if ($NDstudents) {
    // Fetch each row and store the column value in an array
    while ($row = mysqli_fetch_assoc($NDstudents)) {
        $NDstudentsArray[] = $row['matric_number'];
    }
    // Free the result set
    $NDstudents->free();
}
// Check if the query to fetch all lecturers was sucssessful
if ($lec_result) {
    // fetch each row and store the column value in an array
    while ($row = mysqli_fetch_assoc($lec_result)) {
        $NDlecturerArray[] = $row['id'];
    }
}


// """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
//  HND STUDENTS FUNCTIONALITIES
// """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

$lecturer_status = ["Chief Lecturer", "Senior Lecturer", "Lecturer 1", "Lecturer 2"];
$HNDstudents = getStudents("HND");
$HNDstudentsArray = array();
$HNDlecturerArray = HndSupervisors($lecturer_status, $lec_result);
// Check if the query to fetch HND student matric number was successful
if ($HNDstudents) {
    // Fetch each row and store the column value in an array
    while ($row = mysqli_fetch_assoc($HNDstudents)) {
        $HNDstudentsArray[] = $row['matric_number'];
    }
    // Free the result set
    $HNDstudents->free();
}

// """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
//  More Features
// """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

// Setting Table names form the query 
$lecturers = "lecturers";
$nd_supervisor_allocations = "nd_supervisor_allocations";
$hnd_supervisor_allocations = "hnd_supervisor_allocations";

// Start the allocation procedures by checking for button clicked action
if ($_SERVER['REQUEST_METHOD'] == "POST" && isset($_POST['generate'])) {

    // Get lecturer allocations
    $lecturerAllocationArray = (make_allocation($NDstudentsArray, $NDlecturerArray));
        
    // To insert the lecturer allocation into database table
    foreach ($lecturerAllocationArray as $lecturerAllocation) {
        $lec = $lecturerAllocation['Lecturer'];
        $students = implode(" ", $lecturerAllocation['Students']);

        // Insert the alocations into the database storage
        $message = uploadAllocations($nd_supervisor_allocations, $students, $lec, "ND");
    }
    
}

// Fetch the allocation from the database if allocation has been done
$NDallocations = getAllocations($nd_supervisor_allocations, $lecturers);
$HNDallocations = getAllocations($hnd_supervisor_allocations, $lecturers);

?>

<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
        <a href="index.php" class="logo d-flex align-items-center">
            <img src="assets/img/logo.jpg" alt="">
            <span class="d-none d-lg-block">PROJECT</span>
        </a>
        <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">

            <li class="nav-item dropdown pe-3">

                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    <img src="assets/img/profile-img.png" alt="Profile" class="rounded-circle">
                    <span class="d-none d-md-block dropdown-toggle ps-2">Computer Science</span>
                </a><!-- End Profile Iamge Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">
                        <h6>Administrator</h6>
                        <span>Project Cordinator</span>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="./includes/logout.php">
                            <i class="bi bi-box-arrow-right"></i>
                            <span>Sign Out</span>
                        </a>
                    </li>

                </ul><!-- End Profile Dropdown Items -->
            </li><!-- End Profile Nav -->

        </ul>
    </nav>
    <!-- End Icons Navigation -->
</header><!-- End Header -->

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link" style="color: #012970;" href="index.php">
                <i class="bi bi-grid"></i>
                <span>Dashboard</span>
            </a>
        </li><!-- End Dashboard Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-people"></i><span>Lecturer(s)</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="add_lecturer.php">
                        <i class="bi bi-circle"></i><span>Add Lecturer</span>
                    </a>
                </li>
                <li>
                    <a href="view_lecturer.php">
                        <i class="bi bi-circle"></i><span>View Lecturer</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Lecturer Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-people"></i><span>Student(s)</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="add_student.php">
                        <i class="bi bi-circle"></i><span>Add Student</span>
                    </a>
                </li>
                <li>
                    <a href="view_student.php">
                        <i class="bi bi-circle"></i><span>View Student</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Student Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" style="background-color: #f6f9ff; color: #4154f1;" href="allocate.php">
                <i class="bi bi-journal-text"></i>
                <span>Lecturer Allocation</span>
            </a>
        </li><!-- End Lecturer allocation Page Nav -->
    </ul>
</aside><!-- End Sidebar-->

<main id="main" class="main">

    <div class="pagetitle">
        <h1>Allocation</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                <li class="breadcrumb-item active">Lecturer & Student Allocation</li>
            </ol>
        </nav>
        <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="POST">
            <div class="button-group">
                <input type="submit" value="Generate Allocation" name="generate" class="btn btn-outline-primary">
                <span class="text-success"><?php echo $message; ?></span>
            </div>
        </form>
    </div><!-- End Page Title -->

    <section class="section dashboard">
        <div class="row">
            <div class="card shadow py-3">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="example" class="table table-hover" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 50px;">Code</th>
                                    <th>Lecturer Name</th>
                                    <th>Lecturer Status</th>
                                    <th style="width: 200px;">Allocated Students</th>
                                    <th>Programme</th>
                                    <th style="width: 10px;"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php                            
                            if (mysqli_num_rows($NDallocations) > 0) {
                                while ($row = mysqli_fetch_assoc($NDallocations)) {
                                    
                                    echo ' <tr>
                                    <td>'.$row['id'].'</td>
                                    <td>'.$row['lecturer_name'].'</td>
                                    <td>'.$row['lec_status'].'</td>
                                    <td>'.$row['students'].'</td>
                                    <td>'.$row['programme'].'</td>
                                    <td></td>
                                    </tr>';
                                }
                            }
                            ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main><!-- End #main -->
<script>
$(document).ready(function() {
    $('#example')
        .DataTable({
            //disable sorting on last column      
            "columnDefs": [{
                "orderable": false,
                "targets": 5
            }],
            language: {
                //customize pagination prev and next buttons: use arrows instead of words        
                'paginate': {
                    'previous': '<span class="fa fa-chevron-left"></span>',
                    'next': '<span class="fa fa-chevron-right"></span>'
                },
                //customize number of elements to be displayed        
                "lengthMenu": 'Display <select class="form-control input-sm">' +
                    '<option value="10">10</option>' + '<option value="20">20</option>' +
                    '<option value="30">30</option>' + '<option value="40">40</option>' +
                    '<option value="50">50</option>' + '<option value="-1">All</option>' +
                    '</select> results'
            }
        })
});
</script>
<?php require_once './includes/footer.php'; ?>