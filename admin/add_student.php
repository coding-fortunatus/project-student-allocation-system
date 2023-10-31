<?php 
session_start();
require_once './includes/header.php';
require_once './includes/functions.php';

// Check if the user is already logged in, if yes then redirect him to welcome page
if(!isset($_SESSION["loggin"]) && !$_SESSION["loggin"] === true){
    header("location: login.php");
    exit;
}

$mat_number_error = $fullname_error = $email_error = $single_student_error = $file_error = $programme_type_err = "";
$mat_number = $fullname = $email = $single_success = $file_success = $programme_type = $programme_type_error = "";

if ($_SERVER['REQUEST_METHOD'] == "POST" && isset($_POST['single_student'])) {
    if (empty($_POST['mat_number'])) {
        $mat_number_error = "Required";
    } else {
        $mat_number = validate_input($_POST['mat_number']);
    }

    if (empty($_POST['programme']) && $_POST['programme'] === "Choose...") {
        $programme_type_error = "Required";
    } else {
        $programme_type = validate_input($_POST['programme']);
    }

    if (empty($_POST['fullname'])) {
        $fullname_error = "Full name is required";
    } else {
        $fullname = validate_input($_POST['fullname']);
    }

    if (empty($_POST['email'])) {
        $email_error = "Email cannot be empty";
    } else {
        $email = validate_input($_POST['email']);
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $email_error = "Enter a valid email";
        }
    }
    if (empty($mat_number_error) && empty($fullname_error) && empty($email_error)) {
        $sql = "SELECT * FROM students WHERE matric_number = '$mat_number'";
        $query_string = mysqli_query($conn, $sql);
        if (mysqli_num_rows($query_string) > 0) {
            $single_student_error = "Student already exists with this Matric Number";
        } else {
            $query = "INSERT INTO students(matric_number, fullname, email, programme)VALUES('$mat_number', '$fullname', '$email', '$programme_type')";
            if (mysqli_query($conn, $query)) {
                $single_success = "Student successfully added";
            } else {
                $single_student_error = "An erorr occur while adding student";
            }
        }
    } else {
        $single_student_error = "Oops, some errors occur";
    }
}

if ($_SERVER['REQUEST_METHOD'] == "POST" && isset($_POST['upload_student'])) {

    if (empty($_POST['programme_upload']) && $_POST['programme_upload'] == "Choose...") {
        $programme_type_err = "Required";
    } else {
        $programme_type = validate_input($_POST['programme_upload']);
    }
        // Allowed mime types
    $fileMimes = array(
        'text/x-comma-separated-values',
        'text/comma-separated-values',
        'application/octet-stream',
        'application/vnd.ms-excel',
        'application/x-csv',
        'text/x-csv',
        'text/csv',
        'application/csv',
        'application/excel',
        'application/vnd.msexcel',
        'text/plain'
    );

    // Validate whether selected file is a CSV file
    if (!empty($_FILES['students']['name']) && in_array($_FILES['students']['type'], $fileMimes)) {
        // Open uploaded CSV file with read-only mode
        $StudentCsv = fopen($_FILES['students']['tmp_name'], 'r');
        // Skip the first line
        fgetcsv($StudentCsv);
        // Parse data from CSV file line by line
        while (($studentData = fgetcsv($StudentCsv, 10000, ",")) !== FALSE) {
            // Get row data
            $mat_number = $studentData[0];
            $fullname = $studentData[1];
            $email = $studentData[2];

            // If student already exists in the database with the same matric number
            $query = "SELECT * FROM students WHERE matric_number = '$mat_number'";
            $check = mysqli_query($conn, $query);
            $row = mysqli_fetch_assoc($check);
            if (mysqli_num_rows($check) > 0) {
                $sql = "UPDATE students SET fullname = '$fullname', email = '$email', programme = '$programme_type' WHERE matric_number = '$mat_number'";
                if (mysqli_query($conn, $sql)) {
                    $file_success = "Student successfully updated";
                }
            } else {
                $sql = "INSERT INTO students(matric_number, fullname, email, programme)VALUES('$mat_number', '$fullname', '$email', '$programme_type')";
                if (mysqli_query($conn, $sql)) {
                    $file_success = "Students successfully uploaded";
                } else {
                    $file_error = "Oops, an error occured";
                }
            }
        }
        // Close opened CSV file
        fclose($StudentCsv);
    }
    else
    {
        $file_error = "Please select valid file";
    }
}
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
                        <span><?php echo $_SESSION['username'] ?></span>
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
            <a class="nav-link collapsed" style="background-color: #f6f9ff; color: #4154f1;"
                data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
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
            <a class="nav-link collapsed" href="allocate.php">
                <i class="bi bi-journal-text"></i>
                <span>Lecturer Allocation</span>
            </a>
        </li><!-- End Lecturer allocation Page Nav -->
    </ul>
</aside><!-- End Sidebar-->

<main id="main" class="main">

    <div class="pagetitle">
        <h1>Students</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                <li class="breadcrumb-item active">Add Student</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
        <div class="row">

            <!-- Left side columns -->
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-md-5">
                        <div class="card mb-3">
                            <div class="card-body">
                                <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']) ?>" method="POST">
                                    <div class="pt-4 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4">Add Single Student</h5>
                                        <p class="text-warning text-center small">Supply all information
                                            correctly</p>
                                    </div>
                                    <span class="text-success"><?php echo $single_success; ?></span>
                                    <span class="text-danger"><?php echo $single_student_error; ?></span>
                                    <div class="form-group row mb-3">
                                        <div class="col">
                                            <label for="matnumber" class="form-label">Matric Number</label>
                                            <input type="text" class="form-control" name="mat_number" id="matnumber">
                                            <span class="text-danger"><?php echo $mat_number_error; ?></span>
                                        </div>
                                        <div class="col">
                                            <label for="programme" class="form-label">Programme</label>
                                            <select name="programme" id="programme" class="form-select">
                                                <option>Choose...</option>
                                                <option value="ND">ND</option>
                                                <option value="HND">HND</option>
                                            </select>
                                            <span class="text-danger"><?php echo $programme_type_error; ?></span>
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="fullname" class="form-label">Full Name</label>
                                        <input type="text" class="form-control" name="fullname" id="fullname">
                                        <span class="text-danger"><?php echo $fullname_error; ?></span>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="email" class="form-label">Email Address</label>
                                        <input type="text" class="form-control" name="email" id="email">
                                        <span class="text-danger"><?php echo $email_error; ?></span>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input class="btn btn-outline-primary w-100" type="submit" name="single_student"
                                            value="Add Student">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1">
                        <h3 class="h3 ">OR</h3>
                    </div>
                    <div class="col-md-6">
                        <div class="card mb-3">
                            <div class="card-body">
                                <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']) ?>" method="POST"
                                    enctype="multipart/form-data">
                                    <div class="pt-4 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4">Upload all Students</h5>
                                        <p class="text-warning text-center small">Allowed filetype is CSV</p>
                                    </div>
                                    <span class="text-success"><?php echo $file_success; ?></span>
                                    <span class="text-danger"><?php echo $file_error; ?></span>
                                    <div class="form-group mb-3 col-6">
                                        <label for="programme" class="form-label">Choose Programme</label>
                                        <select name="programme_upload" id="programme" class="form-select">
                                            <option>Choose...</option>
                                            <option value="ND">ND</option>
                                            <option value="HND">HND</option>
                                        </select>
                                        <span class="text-danger"><?php echo $programme_type_err; ?></span>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="dptfile" class="form-label">Add Student File</label>
                                        <input type="file" class="form-control" name="students" id="dptfile">
                                        <span class="text-danger"><?php echo $file_error; ?></span>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input class="btn btn-outline-primary w-100" type="submit" name="upload_student"
                                            value="Upload Student">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Left side columns -->
            </div>
        </div>
    </section>
</main><!-- End #main -->
<?php require_once './includes/footer.php'; ?>