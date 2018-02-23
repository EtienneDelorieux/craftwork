module ProjectsHelper
  CATEGORIES_PHOTOS = {
    "Charpenterie" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390412/hvcjal7oemj43tl8qwr2.jpg',
    "Fontainerie" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390897/iylr6628qnfxtculqfum.jpg',
    "Maçonnerie" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390897/iylr6628qnfxtculqfum.jpg',
    "Marbrerie" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390897/iylr6628qnfxtculqfum.jpg',
    "Menuiserie" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390897/iylr6628qnfxtculqfum.jpg',
    "Miroiterie" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390897/iylr6628qnfxtculqfum.jpg',
    "Treillage" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390897/iylr6628qnfxtculqfum.jpg',
    "Charpente métallique" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390412/hvcjal7oemj43tl8qwr2.jpg',
    "Métallerie" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390897/iylr6628qnfxtculqfum.jpg',
    "Bois" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390410/afgbruzrymkbrdl2tjdp.jpg',
    "Composite" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390897/iylr6628qnfxtculqfum.jpg',
    "Cloisonnement" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390897/iylr6628qnfxtculqfum.jpg',
    "Faux plafond" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390897/iylr6628qnfxtculqfum.jpg',
    "Revêtement de sol" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390414/acc2fvm1vrj0arqgasyr.jpg',
    "Peintures" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390415/nodoyegyzyl3v0xjhlqa.jpg',
    "Domotique" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390897/iylr6628qnfxtculqfum.jpg',
    "Isolation" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390738/bgnai6gyymrmlfhilasb.jpg',
    "Plomberie" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390422/lgegww9tlke2bzmdhaf8.jpg',
    "Electricité" => 'http://res.cloudinary.com/dvsmmztrt/image/upload/v1519390777/zwqfcibstbvtzmd1phd9.jpg',
  }
  
  def project_image_path_for(project)
    if project.photo.present?
      cl_image_path project.photo
    else
      category = project.category.name
      CATEGORIES_PHOTOS[category]
    end
  end
end
