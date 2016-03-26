<?php

namespace Plusteam\PointBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('PointBundle:Default:index.html.twig');
    }
}
