module ProjectsHelper
  CATEGORIES_PHOTOS = {
    
  }
  def project_image_path_for(project)
    if project.photo.present?
      cl_image_path project.photo
    else
      'http://placehold.it/400x400'
    end
  end
end
