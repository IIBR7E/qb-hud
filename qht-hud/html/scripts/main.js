$(function () {
  window.addEventListener('message', function (event) {
    if (event.data.action = "update") {
      $(".layer-2 .wrapper .hp").css("width", `calc(${(event.data.health).toFixed(0) + "%"} - 4px)`)
      $(".layer-1 .wrapper .hp").html(`${(event.data.health).toFixed(0)}<br/>HP`)
      // $(".weapon-image").attr("src", `images/weapons/${event.data.weapon}.png`)
      if (typeof event.data.ammo != "undefined") {
        $(".ammo").html(event.data.ammo)
      } else {
        $(".ammo").html(`<img src="images/inf.png">`)
      }
    }
    if (event.data.weapon) {
      $('.weapon-image').attr('src', 'images/weapons/' + event.data.weapon)
      }
      else {
          $('.weapon-image').attr('src', 'images/weapons/unarmed.png')                  
        }

    
    if (event.data.voice == true) {


      $('.mic').html('<i class="fa-solid fa-microphone"></i>')
      $('.mic').css('color', '#7ce7a0')
      $('.mic').css('font-side', '20px')
      $('.mic i').css('left', '0.5vh')

    } else {
      // rgb(0, 153, 255)
      $('.mic').html('<i class="fa-sharp fa-solid fa-microphone-slash"></i>')
      $('.mic').css('color', '  #cccccce4')
      $('.mic').css('font-side', '17px')


    }
    $.post(`https://${GetParentResourceName()}/getAvatars`, function (avatar) {
      // console.log(avatar)
      if (avatar) {

        $('.profileimg').attr('src', avatar);
      }
    });
    let armour = event.data.armour
    let steps = document.getElementsByClassName('step');

    [...steps].forEach(e => {
      armorBar(armour);
    });

    function armorBar(i) {
      let percent = (i / (100 / steps.length)).toFixed(2);
      let [lastId, width] = percent.toString().split(".");

      [...steps].forEach((e, id) => {
        let current = id == lastId ? width : (id <= percent ? 100 : 0)

        $(e).attr("style", `--width: ${current}%`)
      })
    }
  })
})