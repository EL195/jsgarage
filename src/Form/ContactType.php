<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
// Importer le type input mail
use Symfony\Component\Form\Extension\Core\Type\EmailType;
// Importer le type input textaera
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
// Importer le type input text
use Symfony\Component\Form\Extension\Core\Type\TextType;
// Importer le générateur de formulaire
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ContactType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
        // Ajouter le champ nom de type text
            ->add('Nom', TextType::class)
        // Ajouter le champ email de type mail
            ->add('Email', EmailType::class)
        // Ajouter le champ objet de type text
            ->add('objet', TextType::class)
        // Ajouter le message nom de type textaera
            ->add('message', TextareaType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            // Ici vous pouvez configurez les options du formulaire 
        ]);
    }
}
