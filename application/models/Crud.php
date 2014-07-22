<?php

class Application_Model_Crud extends Zend_Db_Table_Abstract {

    protected $_name = 'consumer';
    protected $_db;

    function insert($arr) {
        unset($arr['controller'], $arr['action'], $arr['module']);

        $this->_db->insert($this->_name, $arr);
    }

    function delete($id) {

        $this->_db->delete($this->_name, 'id = ' . $id);
    }

    function edit_select($id) {

        $sql = $this->_db->select()->from($this->_name)->where('id=?', $id);
        return $this->_db->fetchRow($sql);
    }

    function select() {
        $sql = $this->_db->select()->from(array('c' => $this->_name));
        return $fetch = $this->_db->fetchAll($sql);
    }

    public function update($arr) {

        unset($arr['controller'], $arr['action'], $arr['module']);
        $this->_db->update($this->_name, $arr, 'id =' . $arr['id']);
    }

    function sort($arr) {

        foreach ($arr as $key => $value) {
            if ($arr[$key] == '') {
                unset($key);
            }

            if ($key) {

                $placeholder = $key . ' LIKE ?';
                $query = '%' . $arr[$key] . '%';
                $sql = $this->_db->select()
                        ->from($this->_name)
                        ->where($placeholder, $query);

                return $this->_db->fetchAll($sql);
            }
        }
    }

    function sortBy($arr) {

        if ($_SESSION['check'] == ' ASC') {

            $_SESSION['check'] = ' DESC';
        } else {

            $_SESSION['check'] = ' ASC';
        }
        $sql = $this->_db
                ->select()
                ->from($this->_name)
                ->order($arr['by'] . $_COOKIE['check']);

        return $this->_db->fetchAll($sql);
    }

}
