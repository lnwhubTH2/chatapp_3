Rails.application.routes.draw do
  resources :categories do
    # กำหนด routes ย่อยถ้าจำเป็น
  end

  resources :todos do
    # กำหนด routes ย่อยถ้าจำเป็น
  end
end
Rails.application.routes.draw do
  resources :messages
  # เพิ่ม routes อื่น ๆ ที่จำเป็น
end
Rails.application.routes.draw do
  resources :categories do
    resources :todos
  end
end
Rails.application.routes.draw do
  resources :categories
  # Add other routes here
end
Rails.application.routes.draw do
  resources :categories
  resources :todos
  # Add other routes here
end
Rails.application.routes.draw do
  resources :categories
  resources :todos do
    member do
      patch :complete
      patch :incomplete
    end
  end
  # Add other routes here
end
Rails.application.routes.draw do
  resources :categories do
    resources :todos
  end

  # เพื่อให้ /categories แสดงรายการหมวดหมู่ทั้งหมด
  root "categories#index"
end

