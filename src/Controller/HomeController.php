<?php

namespace App\Controller;

use App\Entity\Category;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    public function __construct(private readonly EntityManagerInterface $em)
    {

    }
    /**
     * @Route("/", name="app_home")
     */
    public function index(): Response
    {
        $categories = $this->em->getRepository(Category::class)->findAll();

        return $this->render('home/index.html.twig', [
            'categories' => $categories,
        ]);
    }
}
