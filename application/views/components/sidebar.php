<?php
$user = $this->session->userdata('user');
extract($user);
?>
<body>

<style>
  .nav-item.active {
    background-color: #00f260;
    color: white !important; 
    border-radius: 7px;/* Replace "your-color" with the desired color */
}
.logout-button:hover {
    cursor: pointer;
    background-color: #FF407D;
}
.topnavcolor {

    background-color: #008DDA;
}
</style>
 <!-- Sidenav -->
 <nav class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white" id="sidenav-main">
    <div class="scrollbar-inner">
      <!-- Brand -->
      <div class="sidenav-header  align-items-center">
        <a class="navbar-brand" href="javascript:void(0)">
        <img src="<?php echo base_url('assets/img/brand/PTS_LOGO.png" style="width: 110px; height: 150px" alt="..." ')?>">
        </a>
      </div>
      <div class="navbar-inner"><br><br>
     
        <!-- Collapse -->
        <div class="collapse navbar-collapse" id="sidenav-collapse-main">
    <!-- Nav items -->
    <ul class="navbar-nav">
        <li class="nav-item <?=uri_string() == 'home' ? 'active' : '' ?><?=uri_string() == 'history' ? 'active' : '' ?><?=uri_string() == 'inventory' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/home'?>">
                <i class="ni ni-chart-bar-32 text-white"></i>
                <span class="nav-link-text">Dashboard</span>
            </a>
        </li>
       
        <?php if($area_id=='19'){ ?>
        <li class="nav-item <?=uri_string() == 'areas' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/areas/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Areas</span>
            </a>
        </li>
        <li class="nav-item <?=uri_string() == 'setprocess' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/setprocess/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Set Process</span>
            </a>
        </li>
        <li class="nav-item <?=uri_string() == 'lines' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/lines/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Lines</span>
            </a>
        </li>
        <li class="nav-item <?=uri_string() == 'models' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/models/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Models</span>
            </a>
        </li>
        <?php }else{ }?>
        <?php if($area_id=='19' || $area_id=='1'){ ?>
       
       
        <li class="nav-item <?=uri_string() == 'molddetails' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/molddetails/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Tooling Details</span>
            </a>
        </li>
        <li class="nav-item <?=uri_string() == 'lotdetails' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/lotdetails/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Lot Details</span>
            </a>
        </li>
        <li class="nav-item <?=uri_string() == 'lotcreations' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/lotcreations/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Casting Lot Creation</span>
            </a>
        </li>
        <?php }else{ }?>

        <?php if($area_id=='19' || $area_id=='13'){ ?>
        <li class="nav-item <?=uri_string() == 'medsamplings' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/medsamplings/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Med Sampling</span>
            </a>
        </li>
        <?php }else{ }?>
        <?php if($area_id=='16' || $area_id=='19' ){ ?>
        <li class="nav-item <?=uri_string() == 'debplans' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/debplans/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Deburring Plan</span>
            </a>
        </li>
        <?php }else{ }?>
        <?php if($area_id=='2' || $area_id=='19' ){ ?>
        <li class="nav-item <?=uri_string() == 'deburringins' ? 'active' : '' ?> <?=uri_string() == 'debouts' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/deburringins/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Deburring Area</span>
            </a>
        </li>
        <?php }else{ }?>


        <?php if($area_id=='18' || $area_id=='19' ){ ?>
          <li class="nav-item <?=uri_string() == 'castinglocks' ? 'active' : '' ?> <?=uri_string() == 'castingunlocks' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/castinglocks/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Casting IPQE Lot Locking</span>
            </a>
        </li>
        <li class="nav-item <?=uri_string() == 'shotblastsamplings' ? 'active' : '' ?> <?=uri_string() == 'shotblastunlocks' ? 'active' : '' ?> ">
            <a class="nav-link" href="<?=site_url().'/shotblastsamplings/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Shotblast Sampling</span>
            </a>
        </li>
        <?php }else{ }?>
        <?php if($area_id=='3' || $area_id=='19' ){ ?>
       
       
        <li class="nav-item <?=uri_string() == 'shotblastins' ? 'active' : '' ?> <?=uri_string() == 'shotblastouts' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/shotblastins/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Shotblast Area</span>
            </a>
        </li>
        <?php }else{ }?>

        <?php if($area_id=='4' || $area_id=='19' ){ ?>
        <li class="nav-item <?=uri_string() == 'annealingins' ? 'active' : '' ?> <?=uri_string() == 'annealingouts' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/annealingins/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Annealing Area</span>
            </a>
        </li>
        <?php }else{ }?>

        <?php if($area_id=='15' || $area_id=='19' ){ ?>
       
        <li class="nav-item <?=uri_string() == 'castingmrs' ? 'active' : '' ?> <?=uri_string() == 'shotblastmrs' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/castingmrs/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Diecast MRS</span>
            </a>
        </li>
        
        <?php }else{ }?>

        <?php if($area_id=='5' || $area_id=='19' ){ ?>
        <li class="nav-item <?=uri_string() == 'machiningins' ? 'active' : '' ?> <?=uri_string() == 'machiningouts' ? 'active' : '' ?> <?=uri_string() == 'machiningsplits' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/machiningins/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Machining Area</span>
            </a>
        </li>
       <?php }else{ }?>

       <?php if($area_id=='22' || $area_id=='19' ){ ?>
        <li class="nav-item <?=uri_string() == 'ipqcforjudges' ? 'active' : '' ?> <?=uri_string() == 'ipqcforrejudges' ? 'active' : '' ?> <?=uri_string() == 'splitlottaggings' ? 'active' : '' ?><?=uri_string() == 'splitlotjudgements' ? 'active' : '' ?> ">
            <a class="nav-link" href="<?=site_url().'/ipqcforjudges/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Machining IPQE Inline</span>
            </a>
        </li>
        <?php }else{ }?>

     <?php if($area_id=='23' || $area_id=='19' ){ ?>
        <li class="nav-item <?=uri_string() == 'cmmforjudges' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/cmmforjudges/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Machining IPQE Dimension</span>
            </a>
        </li>
        <?php }else{ }?>

        <?php if($area_id=='11' || $area_id=='19'){ ?>

        <li class="nav-item <?=uri_string() == 'machiningmrs_wet' ? 'active' : '' ?><?=uri_string() == 'machiningmrs_dry' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/machiningmrs_wet/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Machining MRS</span>
            </a>
        </li>
        <?php }else{ }?>

        <?php if($area_id=='19' || $area_id=='22' ){ ?>

        <li class="nav-item <?=uri_string() == 'machiningmrs_dryconf' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/machiningmrs_dryconf/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Machining MRS</span>
            </a>
        </li>
        <?php }else{ }?>

        <?php if($area_id=='6' || $area_id=='19' ){ ?>
        <li class="nav-item <?=uri_string() == 'bubblewashins' ? 'active' : '' ?> <?=uri_string() == 'bubblewashouts' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/bubblewashins/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Bubblewash Area</span>
            </a>
        </li>
        <?php }else{ }?>

        
        <?php if($area_id=='7' || $area_id=='19' ){ ?>
        <li class="nav-item <?=uri_string() == 'ovenins' ? 'active' : '' ?> <?=uri_string() == 'ovenouts' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/ovenins/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Oven Area</span>
            </a>
        </li>
        <?php }else{ }?>

       <?php if($area_id=='8' || $area_id=='19' ){ ?>
        <li class="nav-item <?=uri_string() == 'mfiins' ? 'active' : '' ?> <?=uri_string() == 'mfiouts' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/mfiins/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">MFI Area</span>
            </a>
        </li>
   


        <li class="nav-item <?=uri_string() == 'lotcombine' ? 'active' : '' ?> <?=uri_string() == 'lotsorting' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/lotcombine/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Lot Combine</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" target="_blank" href="http://10.216.128.114/PTS_Printing/">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">QR Code Printing</span>
            </a>
        </li>
        <li class="nav-item <?=uri_string() == 'sublotcombine' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/sublotcombine/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Sub-Lot Combine</span>
            </a>
        </li>

        <?php }else{ }?>

        <?php if($area_id=='9' || $area_id=='19' ){ ?>
        <li class="nav-item <?=uri_string() == 'ogisampling' ? 'active' : '' ?><?=uri_string() == 'reogisampling' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/ogisampling/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">OGI Sampling</span>
            </a>
        </li>
        <?php }else{ }?>
    

        <li class="nav-item <?=uri_string() == 'scraps' ? 'active' : '' ?> ">
            <a class="nav-link" href="<?=site_url().'/scraps/'?>">
                <i class="ni ni-settings text-white"></i>
                <span class="nav-link-text">Scrap Summary</span>
            </a>
        </li>
        <?php if($area_id=='19'){ ?>

        <li class="nav-item <?=uri_string() == 'userroles' ? 'active' : '' ?>">
            <a class="nav-link" href="<?=site_url().'/userroles/'?>">
                <i class="ni ni-circle-08 text-white"></i>
                <span class="nav-link-text">User' Table</span>
            </a>
        </li>
      <?php }else{ }?>
    </ul>
</div>

           
          </ul>
          <!-- Divider -->
          <hr class="my-3">
          <!-- Heading -->
         <!-- <h6 class="navbar-heading p-0 text-muted">
            <span class="docs-normal">Admin Maintenance</span>
          </h6>  -->
          <!-- Navigation -->
          <ul class="navbar-nav mb-md-3">
           
            <li class="nav-item ">
              <!-- <a style="background-color: #C5FFF8;" class="nav-link active active-pro" href="<?php echo base_url(); ?>index.php/user/logout"> -->
              <!-- <a style="background-color: #C5FFF8;" class="nav-link active active-pro" href="<?=site_url().'/Auth/logout'?>"> -->
                <!-- <i style="font-size: 25px" class="ni ni-atom text-dark"></i> -->
                <!-- <span class="nav-link-text"><b>Logout</b></span> -->
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </nav>
  <!-- Main content -->
  <div class="main-content" id="panel">
    <!-- Topnav -->
    <nav class="navbar navbar-top navbar-expand navbar-dark topnavcolor border-bottom">
      <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <!-- Search form -->
          <!-- <form class="navbar-search navbar-search-light form-inline mr-sm-3" id="navbar-search-main">
            <div class="form-group mb-0">
              <div class="input-group input-group-alternative input-group-merge">
                <div class="input-group-prepend">
                  <span class="input-group-text"><i class="fas fa-search"></i></span>
                </div>
                <input class="form-control" placeholder="Search" type="text">
              </div>
            </div>
            <button type="button" class="close" data-action="search-close" data-target="#navbar-search-main" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </form> -->
          <!-- Navbar links -->
          <ul class="navbar-nav align-items-center  ml-md-auto ">
          <li class="nav-item d-xl-none">
              <!-- Sidenav toggler -->
              <div class="pr-3 sidenav-toggler sidenav-toggler-dark" data-action="sidenav-pin" data-target="#sidenav-main">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                </div>
              </div>
            </li>
           
              
          </ul>
          <ul class="navbar-nav align-items-center  ml-auto ml-md-0 ">
            <li class="nav-item dropdown">
              <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <div class="media align-items-center">
                <span class="avatar avatar-sm rounded-circle">
                  <?php 
                  // Assuming $fullname is "Rosly Rapada"
                  $names = explode(' ', $fullname); // Split full name into an array of names
                  $initials = '';
                  foreach ($names as $name) {
                      $initials .= strtoupper(substr($name, 0, 1)); // Extract the first letter of each name and convert to uppercase
                  }
                  echo $initials; // Output: "RR"
                  ?>
                  </span>
                  <div class="media-body  ml-2  d-none d-lg-block">
                    <!-- <span class="mb-0 text-sm  font-weight-bold"><?php echo $fullname; ?></span> -->
                    <span class="mb-0 text-sm  font-weight-bold"><?php echo $fullname; ?></span>
                  </div>
                </div>
              </a>
              <div class="dropdown-menu  dropdown-menu-right ">
                <div class="dropdown-divider"></div>
                <?php if($fullname=='Guest Account' ){ ?>

                <?php }else{ ?>

                <a class="dropdown-item logout-button"   href="<?=site_url().'/profile/'?>">
                <i class="ni ni-circle-08"></i>
                <span>Profile</span>
                </a>

                <?php }?>
                <a class="dropdown-item logout-button" data-toggle="modal"   data-target="#logoutModal">
                  <i class="ni ni-user-run"></i>
                  <span>Logout</span>
                </a>
              </div>
              
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- Header -->
    <!-- Header -->

    

      <!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">Are you sure you want to logout?</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <a class="btn btn-danger" href="<?php echo base_url(); ?>index.php/user/logout">Logout</a>
            </div>
        </div>
    </div>
</div>

  