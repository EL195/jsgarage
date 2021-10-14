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
        $form = $this->createForm(ContactType::class);
        

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
        $contactFormData = $form->getData();
                $message = (new \Swift_Message('Nouveau message de JS Garage!'))
                -> setSubject($contactFormData['objet'])
                ->setFrom($contactFormData['from'])
                ->setTo('micheltanga0@gmail.com')
                ->setBody(
                $contactFormData['message'],
                'text/html'
                );
                $mailer->send($message);
               // $this->get('mailer')->send($message);


                $this->addFlash('success', 'Message envoyé');
                return $this->redirectToRoute('contact');
        }

        return $this->render('contact/index.html.twig', [
            //'our_form' => $form,
            'controller_name' => 'ContactController',
            'our_form' => $form->createView(),
         ]);


   
    }
}
