var imgFeature = document.querySelector('.img-feature');
var listImg = document.querySelectorAll('.list_img img');
var btnPre = document.querySelector('.img_control-previous');
var btnNext = document.querySelector('.img_control-next');
var currentIndex = 0
listImg.forEach((imgElement, index) => {
    imgElement.addEventListener('click', e => {
        updateImgByIndex(index)
    });
});

function updateImgByIndex(index) {
    //remove active class
    document.querySelectorAll('.list_img div').forEach(item => {
            item.classList.remove('active')
        }
    )
    currentIndex = index
    imgFeature.src = listImg[index].getAttribute('src');
    listImg[index].parentElement.classList.add('active')

}

btnPre.addEventListener('click', e => {
    if (currentIndex == 0) {
        currentIndex = listImg.length - 1
    } else {
        currentIndex--
    }
    updateImgByIndex(currentIndex)


})
btnNext.addEventListener('click', e => {
        if (currentIndex == listImg.length - 1) {
            currentIndex = 0
        } else {
            currentIndex++
        }
        updateImgByIndex(currentIndex)
    }
)
updateImgByIndex(0)

// xu li js cho thong so ki thuat va noi dung
function showContent(number) {

    var contentBlog = document.getElementById('content_blog');
    var contentBlogRating = document.getElementById('content_blog-rating');
    if (number === 1) {
        contentBlog.style.display = 'block'
        contentBlogRating.style.display = 'none'

    } else {
        contentBlogRating.style.display = 'block';
        contentBlog.style.display = 'none';

    }
}