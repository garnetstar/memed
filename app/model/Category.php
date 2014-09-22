<?php
namespace App\Model;


use Nette\Caching\Cache;
use Nette\Database\Context;
use Nette\Database\Table\ActiveRow;

class Category
{

	/**
	 * @var \Nette\Database\Context
	 */
	private $context;
	/**
	 * @var \Nette\Caching\Cache
	 */
	private $cache;

	public function __construct(Context $context, Cache $cache)
	{
		$this->context = $context;
		$this->cache = $cache;
	}

	private function getTable()
	{
		return $this->context->table("category");
	}

	public function getAll($parentID)
	{
		return $this->context->query("SELECT * FROM category WHERE", ["parent" => $parentID]);
	}

	/**
	 * @param $categoryID
	 * @param bool $addThis
	 * @return array|ActiveRow[]
	 */
	public function getParents($categoryID, $addThis = true)
	{
		$cacheKey = get_class() . __FUNCTION__ . $categoryID . "_" . (string) $addThis;
		echo $cacheKey."<br>";
		$parents = $this->cache->load($cacheKey);

		if (null == $parents)
		{
			$parents = [];

			if ($addThis)
			{
				$parents[] = $this->getTable()->get($categoryID)->toArray();
			}
			$this->getParent($categoryID, $parents);

			$parents = array_reverse($parents);

			$this->cache->save($cacheKey, $parents);
		}
		return $parents;
	}

	/**
	 * @param $categoryID
	 * @return array
	 */
	public function getAllInTree($categoryID)
	{
		$cacheKey = get_class() . __FUNCTION__ . $categoryID;

		$category = $this->cache->load($cacheKey);

		if (null == $category)
		{
			$category = [];
			$this->getTree($categoryID, $category);

			$this->cache->save($cacheKey, $category);
		}

		return $category;
	}

	private function getTree($categoryID, & $categoryTree, $level = 0)
	{
		$category = $this->getTable()->get($categoryID);
		$categoryTree[][$level] = $category->toArray();
		$child = $category->related("category.parent");
		if (count($child) > 0)
		{
			$level++;
			foreach ($child as $one)
			{
				$this->getTree($one->categoryID, $categoryTree, $level);
			}
		}

	}

	private function getParent($categoryID, array &$parents)
	{
		$category = $this->getTable()->get($categoryID);
		$parent = $category->ref("category", "parent");
		if (null !== $parent)
		{
			$parents[] = $parent->toArray();
			$this->getParent($parent->categoryID, $parents);
		}
	}


} 