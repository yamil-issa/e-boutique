<?php

namespace App\Form;

use App\Entity\CustomerAddress;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class OrderType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
       $user = $options['user'];
        $builder
            ->add('adresses', EntityType::class, [
                'class'=> CustomerAddress::class,
                'label' => false,
                'required' => true,
                'multiple' => false,
                'choices' => $user->getCustomerAddresses(),
                
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'user'=> []
        ]);
    }
}
