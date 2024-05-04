<?php 
    include("class/adminback.php");
    $obj= new adminback();

    if(isset($_POST['admin_btn'])){
        $log_msg = $obj->admin_login($_POST);
    }
    session_start();
    if(isset($_SESSION['admin_id'])){
        header("location:dashboard.php");
    }
?>

<?php 
    include ("includes/head.php")
?>

  <body>

  <section class="login p-fixed d-flex text-center bg-primary common-img-bg">
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    <div class="login-card card-block auth-body mr-auto ml-auto">
                        <form action="" method="post" class="md-float-material">
                            <div class="text-center">
                              
                            </div>
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-left txt-primary">Sign In</h3>
                                        <h6 class="text-danger text-left">
                                            <?php 
                                                if(isset($log_msg)){
                                                    echo $log_msg;
                                                }
                                            ?>
                                        </h6>
                                    </div>
                                </div>
                                <hr/>
                                <div class="input-group">
                                    <input type="email" class="form-control" placeholder="Your Email Address" name="admin_email">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="password" class="form-control" placeholder="Password" name="admin_pass">
                                    <span class="md-line"></span>
                                </div>
                                <div class="row m-t-25 text-left">
                                    <div class="col-sm-7 col-xs-12">
                                        <div class="checkbox-fade fade-in-primary">
                                            
                                        </div>
                                    </div>
  
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <input type="submit" name="admin_btn" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20" value="Sign in">
                                    </div>
                                </div>
                                <hr/>

                                <p class="text-dark h5">a@a.a</p>
                                <p class="text-dark">Pass: 1234</p>
                                <div class="row">

                                    <div class="col-md-2">
                                        <img src="assets/images/auth/Logo-small-bottom.png" alt="small-logo.png">
                                    </div>
                                </div>

                            </div>
                        </form>
                        <!-- end of form -->
                    </div>
                    <!-- Authentication card end -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
	

  

<?php 
    include ("includes/script.php")
?>

