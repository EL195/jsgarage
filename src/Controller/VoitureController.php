<?php

namespace App\Controller;

use App\Entity\RechercheVoiture;
use App\Form\RechercheVoitureType;
use App\Repository\VoitureRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use ContainerPDCMZuP\PaginatorInterface_82dac15;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class VoitureController extends AbstractController
{
    /**
     * @Route("/client/voitures", name="voitures")
     */
    public function index(VoitureRepository $repo, PaginatorInterface $paginatorInterface, Request $request)
    {
        $rechercheVoiture = new RechercheVoiture();
        // Création du formulaire de recherche
        $form = $this->createForm(RechercheVoitureType::class, $rechercheVoiture);
        $form->handleRequest($request);
        // Création de la pagination
        $voitures = $paginatorInterface->paginate
        (
            $repo->findAllWithPagination($rechercheVoiture), 
            $request->query->getInt('page', 1),
            6
        );
        //Afficher le formulaire d erecherche avecla création des champs du formulaire de création d'une voiture
        return $this->render('voiture/voitures.html.twig',
        [
            "voitures" => $voitures,
            "form" => $form->createView(),
            "admin" => false
        ]);
    }
}
