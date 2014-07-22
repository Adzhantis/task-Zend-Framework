
<?php

class Application_Model_Auth {

    public function login($username, $password) {
        $db = Zend_Db_Table::getDefaultAdapter();
        $authAdapter = new Zend_Auth_Adapter_DbTable($db);
        $authAdapter->setTableName('consumer');
        $authAdapter->setIdentityColumn('Login');
        $authAdapter->setCredentialColumn('Password');
        $authAdapter->setIdentity($username);
        $authAdapter->setCredential($password);
        $auth = Zend_Auth::getInstance();
        $result = $auth->authenticate($authAdapter);
        if ($result->isValid()) {
            $data = $authAdapter->getResultRowObject();
            $auth->getStorage()->write($data);
            return true;
        } else {
            return false;
        }
    }

}
