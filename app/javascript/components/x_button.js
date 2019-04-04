const hidePhoto = () => {
  let bannerX = document.getElementById('banner-x')
  if (bannerX) {
    bannerX = addEventListener('click', () => {
        document.getElementById('banner-flex').classList.add('d-none')
        document.getElementById('banner-photo').classList.remove('d-none')
    })
  }
}

export { hidePhoto };
