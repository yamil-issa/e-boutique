<?php

namespace App\Form;

use App\Entity\CustomerAddress;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CustomerAddressType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            
            ->add('address', TextType::class, [
                'label' => 'votre adresse'
            ])
            ->add('cp', TextType::class, [
                'label' => 'cp'
            ])
            ->add('city', TextType::class, [
                'label' => 'votre ville'
            ])
            ->add('country', TextType::class, [
                'label' => 'votre pays'
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => CustomerAddress::class,
        ]);
    }
}
