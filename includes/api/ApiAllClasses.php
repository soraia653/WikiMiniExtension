<?php

namespace MediaWiki\Extension\Wikimini\api;

use ApiBase;

class ApiAllClasses extends \ApiQueryBase {

	/**
	 * @param \ApiQuery $query
	 * @param string $moduleName
	 */
	public function __construct( $query, $moduleName ) {
		parent::__construct( $query, $moduleName );
	}

	public function execute() {
<<<<<<< HEAD
	
=======

		// get user
        $user = $this->getUser();
        $userid = $user->getId();
		
>>>>>>> a2487c2f5d4d6e2ba9d49f03f8ddd97c8e0c7c34
		$db = $this->getDB();

		$this->addTables('wm_classes');
		
		$this->addFields([
<<<<<<< HEAD
			'class_id',
			'class_name',
			'class_teacher_user_id'
=======
			'class_name'
		]);

		$this->addWhere([
			'class_teacher_user_id' => $userid
>>>>>>> a2487c2f5d4d6e2ba9d49f03f8ddd97c8e0c7c34
		]);

		$res = $this->select( __METHOD__ );
		$result = $this->getResult();

		foreach($res as $row) {
			$vals = [
<<<<<<< HEAD
					'id' => (int)$row->class_id,
					'name' => $row->class_name,
					'teacherid' => (int)$row->class_teacher_user_id
=======
					'name' => $row->class_name
>>>>>>> a2487c2f5d4d6e2ba9d49f03f8ddd97c8e0c7c34
				];
			$fit = $result->addValue( [ 'query', $this->getModuleName() ], null, $vals );
		}
	}

	/** @inheritDoc */
	protected function getExamplesMessages() {
		return [
			'action=query&list=allclasses'
				=> 'apihelp-allclasses-example-1'
		];
	}
}
