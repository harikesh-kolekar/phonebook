object @gallary 
attributes :id, :title
node(:thumb_photo) { |m| m.photo.url(:thumb)}
node(:medium_photo) { |m| m.photo.url(:medium)}
node(:photo) { |m| m.photo.url}