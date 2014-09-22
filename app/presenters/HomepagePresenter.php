<?php

namespace App\Presenters;

use App\Lib\Component\CategoryBreadCrumb;
use App\Model\Category;
use Nette;


/**
 * Homepage presenter.
 */
class HomepagePresenter extends BasePresenter
{

	/**
	 * @var Category
	 */
	private $category;

	public function __construct(Category $category)
	{
		$this->category = $category;
	}

	public function renderDefault()
	{
		dump($this->category->getParents(5));
		dump($this->category->getAllInTree(1));
	}

}
