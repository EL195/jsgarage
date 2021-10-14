<?php

namespace App\Controller;

use App\Form\ContactType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;

class ContactController extends AbstractController
{
    /**
     * @Route("/contact", name="contact")
     */
    public function index(Request $request, \Swift_Mailer $mailer): Response
    {
        // Création du formulaire
        $form = $this->createForm(ContactType::class);
        
        //Récupération des infos du formulaire s'il est soumis puis envoi du mail
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
        $contactFormData = $form->getData();
                $message = (new \Swift_Message('Nouveau message de JS Garage!'))
                -> setSubject($contactFormData['objet'])
                ->setFrom($contactFormData['Email'])
                ->setTo('micheltanga0@gmail.com')
                ->setBody(
                $contactFormData['message'],
                'text/html'
                );
                $mailer->send($message);
               // $this->get('mailer')->send($message);

                //Afficher le message si le mail a été envoyé
                $this->addFlash('success', 'Message envoyé');
                //Revenir sur la page
                return $this->redirectToRoute('contact');
        }
        // Afficher le formulaire avec al création des champs
        return $this->render('contact/index.html.twig', [
            'controller_name' => 'ContactController',
            'our_form' => $form->createView(),
         ]);


   
    }
}
