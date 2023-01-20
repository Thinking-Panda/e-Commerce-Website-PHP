<?php
require_once('util/main.php');
 include 'view/header.php'; 
include 'view/navBar.php'; 
$action = filter_input(INPUT_POST, 'action');
if ($action == NULL) {
    $action = filter_input(INPUT_GET, 'action');
    if ($action == NULL) {        
        $action = 'view_home';
        //if (isset($_SESSION['user'])) {
          //  $action = 'view_account';
        //}
    }
} 

switch($action){
    case 'view_home':
        include('home_view.php');
        break;
	case 'view_login':
        // Clear login data
        $email = '';
        $password = '';
        $password_message = '';
        
        include ('account/index.php');
        break;
}
include 'view/footer.php';
?>

