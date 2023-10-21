<?php
session_start();
session_unset();
session_reset();
session_abort();
header("Location: ../login.php");