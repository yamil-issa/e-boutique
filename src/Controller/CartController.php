<?php

namespace App\Controller;

use App\Entity\Product;
use App\Service\CartService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;

class CartController extends AbstractController
{
    #[Route('/cart', name: 'cart_index')]
    public function index(CartService $cartService): Response
    {

        return $this->render('cart/index.html.twig', [
            'cart' => $cartService->getTotal()
        ]);
    }

    #[Route('/cart/add/{id<\d+>}', name: 'cart_add')]
    public function addToRoute(CartService $cartService, int $id, Request $request): Response
    {
        $cartService->addToCart($id);
        $referer = $request->headers->get('referer');
        $referer .= (parse_url($referer, PHP_URL_QUERY) ? '&' : '?') . 'added=1';
        
        return $this->redirect($referer);

       
    }

    #[Route('/cart/decrease/{id<\d+>}', name: 'cart_decrease')]
    public function decrease(CartService $cartService, int $id): RedirectResponse
    {
        $cartService->decrease($id);
        return $this->redirectToRoute('cart_index');
    }

    #[Route('/cart/remove/{id<\d+>}', name: 'cart_remove')]
    public function removeFromCart(CartService $cartService, int $id): Response
    {
        $cartService->removeFromCart($id);
        return $this->redirectToRoute('cart_index');
    }


    #[Route('/cart/removeAll', name: 'cart_removeAll')]
    public function removeAll(CartService $cartService): Response
    {
        $cartService->removeAll();
        return $this->redirectToRoute('cart_index');
    }
}
