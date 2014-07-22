<?php

class IndexController extends Zend_Controller_Action {

    public function indexAction() {
        
    }

    public function loginAction() {
        $login = $this->getParam('Login');
        $password = $this->getParam('Password');
        $x = new Application_Model_Auth();
        if ($x->login($login, $password))
            $this->_redirect('/show/show');
        else
            $this->_redirect('/error/error');
    }

}
