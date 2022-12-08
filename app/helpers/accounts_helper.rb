module AccountsHelper

    def profile_picture account, width = 100
        image_path = account.image.present? ? account.image.thumb.url : "placeholder-profile.jpg"
        image_tag (image_path), width: width, class: "img-fluid rounded-circle"
    end
end
