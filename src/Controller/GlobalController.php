<?php

namespace App\Controller;

use App\Entity\Utilisateur;
use App\Form\InscriptionType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class GlobalController extends AbstractController
{
    /**
     * @Route("/", name="accueil")
     */
    public function index()
    {
        return $this->render('global/accueil.html.twig');
    }

    /**
     * @Route("/inscription", name="inscription")
     */
    public function inscription(Request $request, EntityManagerInterface $om, UserPasswordHasherInterface $passwordHasher)
    {
        $utilisateur = new Utilisateur();
        $form = $this->createForm(InscriptionType::class, $utilisateur);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {            
            $passwordCrypte = $passwordHasher->hashPassword($utilisateur, $utilisateur->getPassword());
            $utilisateur->setPassword($passwordCrypte);
            $utilisateur->setRoles("ROLE_USER");
            $om->persist($utilisateur);
            $om->flush();
            return $this->redirectToRoute("accueil");
        }

        
        return $this->render('global/inscription.html.twig',
        [
            "form" => $form->createView()
        ]);
    }

    /**
     * @Route("/login", name="login")
     */
    public function login(AuthenticationUtils $util)
    {
        return $this->render('global/login.html.twig',
        [
            "lastUserName" => $util->getLastUserName(),
            "error" => $util->getLastAuthenticationError()
        ]);
    }

    /**
     * @Route("/logout", name="logout")
     */
    public function logout()
    {
        
    }
    
    
}
