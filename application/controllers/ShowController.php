<?php

class ShowController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function showAction() {
        $x = new Application_Model_Crud();
        $this->view->fetch = $x->select();
    }

    public function editAction() {
        $id = $this->getParam('id');
        $x = new Application_Model_Crud();
        $this->view->fetch = $x->edit_select($id);
    }

    public function delAction() {
        $id = $this->getRequest()->getParam('id');
        $x = new Application_Model_Crud();
        $x->delete($id);
        $this->_redirect('/show/show');
    }

    public function updateAction() {
        $arr = $this->getRequest()->getParams();
        $temp = $_FILES['avatar_extension']['tmp_name'];
        $name = $_FILES['avatar_extension']['name'];
        $type = explode('.', $name);

        $jpg = array_pop($type);
        move_uploaded_file($temp, 'upload/consumer_avatar/' . $arr['id'] . '.' . $jpg);
        $arr['avatar_extension'] = $arr['id'] . '.' . $jpg;
        $x = new Application_Model_Crud();
        $x->update($arr);

        $this->_redirect('show/edit/id/' . $arr['id']);
    }

    public function addAction() {
        if ($_POST) {
            var_dump($_FILES['avatar_extension']);
            $temp = $_FILES['avatar_extension']['tmp_name'];
            $name = $_FILES['avatar_extension']['name'];
            $type = explode('.', $name);

            $arr = $this->getRequest()->getParams();
            //var_dump($arr);

            $x = new Application_Model_Crud();
            $id = $x->select();
            $ip = count($id) - 1;
            $ir = $id[$ip]['id'] + 1;
            $jpg = array_pop($type);
            move_uploaded_file($temp, 'upload/consumer_avatar/' . $ir . '.' . $jpg);
            $arr['avatar_extension'] = $id[$ip]['id'] + 1 . '.' . $jpg;

            $x->insert($arr);

            $this->_redirect('/show/show');
        }
    }
     public function sortAction() {
        $arr = $this->getRequest()->getParams();
        unset($arr['controller'], $arr['action'], $arr['module']);
        $x = new Application_Model_Crud();
        $this->view->fetch = $x->sort($arr);
    }

    public function ascAction() {
        $arr = $this->getRequest()->getParams();
        unset($arr['controller'], $arr['action'], $arr['module']);
        $x = new Application_Model_Crud();
        $this->view->fetch = $x->sortBy($arr);
    }

}
