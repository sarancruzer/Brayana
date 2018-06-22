<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

class Api extends REST_Controller {

	public function __construct($config = 'rest')
    {
        
      

        parent::__construct();
        // $this->output->set_header("Access-Control-Allow-Origin: *");
        header_remove('Access-Control-Allow-Origin');
        $this->load->model('Api_model');
            $this->load->helper('url_helper');
            $this->isAuth = $this->Api_model->validateToken();
            $this->userType = $this->isAuth->type;
            if(!$this->isAuth){
                $this->set_response("Unauthorised", REST_Controller::HTTP_UNAUTHORIZED);
                return;
            }
    }
    
    /** Land master**/

    /*
    $this->get('blah'); // GET param
    $this->post('blah'); // POST param
    $this->put('blah'); // PUT param*/
   
    public function lands_get($id=""){
       if(!empty($this->isAuth)){
           $options = array();
           if($id){
               $options["where"] = "site_id = ".$id ;
           }
           $return = $this->Api_model->getLands($options);
           $response = array("STATUS"=>"OK","RESPONSE"=>$return);
           $this->set_response($response, REST_Controller::HTTP_OK);
       } 
        
    }
    public function addLand_post(){
        if(!empty($this->isAuth)){
            $POST = $this->post();
        $data = array(
                        "site_name" => $POST['site_name'],
                        "survey_no"=> $POST['survey_no'],
                        "city"=> $POST['city'],
                        "area"=>$POST['area'],
                        "inst_month"=>$POST['inst_month'],
                        "inst_amount"=>$POST['inst_amount'],
                        "Total_amount"=>$POST['Total_amount'],
                        
                );
        $table = "land_master";
        $id = $this->Api_model->insert_data($table,$data);
        if($id){
            $this->lands_get($id);
        }else{
            $response = array("STATUS"=>"NOK","RESPONSE"=>"Data Failed");
            $this->set_response($response, REST_Controller::HTTP_OK);
        }
        
       } 
    }
    
    public function editLand_post($id){
        if(!empty($this->isAuth)){
        $POST = $this->post();
        $data = array(
                        "site_name" => $POST['site_name'],
                        "survey_no"=> $POST['survey_no'],
                        "city"=> $POST['city'],
                        "area"=>$POST['area'],
                        "inst_month"=>$POST['inst_month'],
                        "inst_amount"=>$POST['inst_amount'],
                        "Total_amount"=>$POST['Total_amount'],
                        
                );
        $table = "land_master";	
        $id = $this->Api_model->update_data($table,$data, array('site_id'=>$id));
        if($id){
            $this->lands_get($id);
        }else{
            $response = array("STATUS"=>"NOK","RESPONSE"=>"Data Failed to update");
            $this->set_response($response, REST_Controller::HTTP_OK);
        }
        
       } 
    }
    
   
    public function deleteLand_post($id){
        if(!empty($this->isAuth)){
        
        $table = "land_master";	
        $id = $this->Api_model->delete_data($table, array('site_id'=>$id));
        if($id){
            $response = array("STATUS"=>"OK","RESPONSE"=>"Data Deleted");
            $this->set_response($response, REST_Controller::HTTP_OK);
        }else{
            $response = array("STATUS"=>"NOK","RESPONSE"=>"Data Failed to Deleta");
            $this->set_response($response, REST_Controller::HTTP_OK);
        }
        
       } 
    }



    /** Chit master**/

    /*
    $this->get('blah'); // GET param
    $this->post('blah'); // POST param
    $this->put('blah'); // PUT param*/
    
    public function chits_get($id=""){
       if(!empty($this->isAuth)){
           $options = array();
           if($id){
               $options["where"] = "chit_id = ".$id ;
           }
           $return = $this->Api_model->getChits($options);
           $response = array("STATUS"=>"OK","RESPONSE"=>$return);
           $this->set_response($response, REST_Controller::HTTP_OK);
       } 
        
    }
    public function addChit_post(){
        if(!empty($this->isAuth)){
            $POST = $this->post();
        $data = array(
                        "fund_type" => $POST['fund_type'],
                        "inst_month"=>$POST['inst_month'],
                        "inst_amount"=>$POST['inst_amount'],
                        "total_amount"=>$POST['total_amount'],
                );
        $table = "chit_master";
        $id = $this->Api_model->insert_data($table,$data);
        if($id){
            $this->chits_get($id);
        }else{
            $response = array("STATUS"=>"NOK","RESPONSE"=>"Data Failed to update");
            $this->set_response($response, REST_Controller::HTTP_OK);
        }
        
       } 
    }
    
    public function editChit_post($id){
        if(!empty($this->isAuth)){
        $POST = $this->post();
        $data = array(
                        "fund_type" => $POST['fund_type'],
                        "inst_month"=>$POST['inst_month'],
                        "inst_amount"=>$POST['inst_amount'],
                        "total_amount"=>$POST['total_amount'],
                );
        $table = "chit_master"; 
        $id = $this->Api_model->update_data($table,$data, array('chit_id'=>$id));
        if($id){
            $this->chits_get($id);
        }else{
            $response = array("STATUS"=>"NOK","RESPONSE"=>"Data Failed to update");
            $this->set_response($response, REST_Controller::HTTP_OK);
        }
        
       } 
    }
    
   
    public function deleteChit_post($id){
        if(!empty($this->isAuth)){
        
        $table = "chit_master"; 
        $id = $this->Api_model->delete_data($table, array('chit_id'=>$id));
        if($id){
            $response = array("STATUS"=>"OK","RESPONSE"=>"Data Deleted");
            $this->set_response($response, REST_Controller::HTTP_OK);
        }else{
            $response = array("STATUS"=>"NOK","RESPONSE"=>"Data Failed to Deleta");
            $this->set_response($response, REST_Controller::HTTP_OK);
        }
        
       } 
    }




    /** Chit master**/

    /*
    $this->get('blah'); // GET param
    $this->post('blah'); // POST param
    $this->put('blah'); // PUT param*/
    
    public function agars_get($id=""){
       if(!empty($this->isAuth)){
           $options = array();
           if($id){
               $options["where"] = "site_id = ".$id ;
           }
           $return = $this->Api_model->getAgars($options);
           $response = array("STATUS"=>"OK","RESPONSE"=>$return);
           $this->set_response($response, REST_Controller::HTTP_OK);
       } 
        
    }
    public function addAgar_post(){
        if(!empty($this->isAuth)){
        $POST = $this->post();
        $data = array(
                        "site_name" => $POST['site_name'],
                        "no_tree"=>$POST['no_tree'],
                        "tree_amount"=>$POST['tree_amount'],
                );
        $table = "tree_master";
        $id = $this->Api_model->insert_data($table,$data);
        if($id){
            $this->agars_get($id);
        }else{
            $response = array("STATUS"=>"NOK","RESPONSE"=>"Data Failed to update");
            $this->set_response($response, REST_Controller::HTTP_OK);
        }
        
       } 
    }
    
    public function editAgar_post($id){
        if(!empty($this->isAuth)){
        $POST = $this->post();
        $data = array(
                        "site_name" => $POST['site_name'],
                        "no_tree"=>$POST['no_tree'],
                        "tree_amount"=>$POST['tree_amount'],
                );
        $table = "tree_master";
        $id = $this->Api_model->update_data($table,$data, array('site_id'=>$id));
        if($id){
            $this->agars_get($id);
        }else{
            $response = array("STATUS"=>"NOK","RESPONSE"=>"Data Failed to update");
            $this->set_response($response, REST_Controller::HTTP_OK);
        }
        
       } 
    }
    
   
    public function deleteAgar_post($id){
        if(!empty($this->isAuth)){
        
        $table = "tree_master"; 
        $id = $this->Api_model->delete_data($table, array('site_id'=>$id));
        if($id){
            $response = array("STATUS"=>"OK","RESPONSE"=>"Data Deleted");
            $this->set_response($response, REST_Controller::HTTP_OK);
        }else{
            $response = array("STATUS"=>"NOK","RESPONSE"=>"Data Failed to Deleta");
            $this->set_response($response, REST_Controller::HTTP_OK);
        }
        
       } 
    }


    public function registerCustomer_post($type){
        if(!empty($this->isAuth)){
            if($this->userType !=3){
                $POST = $this->post();
                if(isset($POST['user_mobile']) && !empty($POST['user_mobile'])){
                    $options = array();
                    $userId =  $POST['user_mobile'];
                    $options["where"] = "user_name = '".$userId."'" ;
                    $userDetail = $this->Api_model->getUsers($options);
                     
                    if(!$userDetail["count"]){
                        $data = array(
                                    "user_name" => $POST['user_mobile'],
                                    "user_password" => md5($POST['user_mobile']),
                                    "user_mobile" => $POST['user_mobile'],
                                    "user_email"=>(isset($POST['user_email']) && !empty($POST['user_email']) ? $POST['user_email']: ""),
                                    "user_type"=>3,
                                );      
                        $table = "user_login";
                        $id = $this->Api_model->insert_data($table,$data);
                        if($id){
                                $userId =  $POST['user_mobile'];
                                $options["where"] = "id = ".$id;
                                $userDetail = $this->Api_model->getUsers($options);
                                
                        }else{
                            $response = array("STATUS"=>"NOK","RESPONSE"=>"Registration Failed");
                            $this->set_response($response, REST_Controller::HTTP_OK);
                        }
                    }
                    $options = array();
                    $userId =  $POST['user_mobile'];
                    $options["where"] = "mobile = '".$userId."'" ;
                    $customerDetail = $this->Api_model->getCustomers($options);
                    if($type == "land"){
                        $t_id= 1;
                    }else if($type == "chit"){
                        $t_id= 2;
                    }else{
                        $t_id= 3;
                    }
                    if(!$customerDetail["count"]){
                        $data = array(
                                    "login_id" => $userDetail["data"][0]["id"],
                                    "name" => $POST['user_mobile'],
                                    "mobile" => $POST['user_mobile'],
                                    "email_id"=>(isset($POST['user_email']) && !empty($POST['user_email']) ? $POST['user_email']: ""),
                                    "address"=>$POST['address'],
                                    "added_by"=>$this->isAuth->id,
                                    "type"=>$t_id,
                                );      
                        $table = "customers";
                        $id = $this->Api_model->insert_data($table,$data);
                    }
                    $options = array();
                    $userId =  $POST['user_mobile'];
                    $options["where"] = "mobile = '".$userId."'" ;
                    $customerDetail = $this->Api_model->getCustomers($options);

                    $options = array();
                    $booking_no =  $POST['booking_no'];
                    $options["where"] = "booking_no = '".$booking_no."'" ;
                    if($type=="land"){
                                $data = array(
                                    "site_id" => $POST['site_id'],
                                    "booking_no" => $POST['booking_no'],
                                    "customer_id"=> $customerDetail["data"][0]["customer_id"],
                                    "inst_month"=> $POST['inst_month'],
                                    "inst_amount"=> $POST['inst_amount'],
                                    "tot_amount"=> $POST['tot_amount'],
                                    "added_by"=>$this->isAuth->id,
                                );      
                                $table = "land_booking";
                                $id = $this->Api_model->insert_update($table,$data,$options);   
                    }

                    if($type=="chit"){
                                $data = array(
                                    "chit_id" => $POST['chit_id'],
                                    "booking_no" => $POST['booking_no'],
                                    "customer_id"=> $customerDetail["data"][0]["customer_id"],
                                    "inst_month"=> $POST['inst_month'],
                                    "inst_amount"=> $POST['inst_amount'],
                                    "tot_amount"=> $POST['tot_amount'],
                                    "added_by"=>$this->isAuth->id,
                                );      
                                $table = "chit_booking";
                                $id = $this->Api_model->insert_update($table,$data,$options);   
                    }

                    if($type=="agar"){
                                $data = array(
                                    "agar_id" => $POST['agar_id'],
                                    "booking_no" => $POST['booking_no'],
                                    "customer_id"=> $customerDetail["data"][0]["customer_id"],
                                    "no_tree"=> $POST['no_tree'],
                                    "inst_month"=> $POST['inst_month'],
                                    "inst_amount"=> $POST['inst_amount'],
                                    "tot_amount"=> $POST['tot_amount'],
                                    "added_by"=>$this->isAuth->id,
                                );      
                                $table = "agar_booking";
                                $id = $this->Api_model->insert_update($table,$data,$options);   
                    }

                    $options = array();
                    $userId =  $POST['user_mobile'];
                    $options["where"] = "user_name = '".$userId."'" ;
                    $userDetail = $this->Api_model->getUsers($options);

                    $response = array("STATUS"=>"OK","RESPONSE"=>$userDetail);
                    $this->set_response($response, REST_Controller::HTTP_OK);
                }else{
                    $response = array("STATUS"=>"NOK","RESPONSE"=>"No Mobile number found");
                    $this->set_response($response, REST_Controller::HTTP_OK);
                }
            }else {
                $response = array("STATUS"=>"NOK","RESPONSE"=>"Not Authorised get this information");
                $this->set_response($response, REST_Controller::HTTP_OK);
            }
    
       }
    }


    public function getUsers_get($userId=""){
       if(!empty($this->isAuth)){
            $options = array();
            if(!empty($userId) && is_numeric($userId)){
                if(strlen($userId) == 10){
                    $options["where"] = "user_name = '".$userId."'" ;
                }else{
                    $options["where"] = "id = ".$userId ;
                }
            }
            $return = $this->Api_model->getUsers($options);
            $response = array("STATUS"=>"OK","RESPONSE"=>$return);
            $this->set_response($response, REST_Controller::HTTP_OK);
       } 

    }

}
