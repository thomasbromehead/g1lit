class Carousel{

    /**
     * @param {HTMLElement} element 
     * @param {Object} options 
     * @param {Object} options.slidesToScroll Total number of slides
     * @param {Object} options.visibleSlides Nb of slides that should be visible at once
     */
  constructor (element, options = {}) {
      this.element = element;
      this.options = Object.assign({},{
        slidesToScroll: 1,
        visibleSlides: 1
      }, options)
      //Convert Nodelist into array and exclude last item which is being appended by the function. We only want the children at runtime prior to function execution
      this.children = [].slice.call(element.children);
      // Replaces : this.children = element.children;
      console.log(this.children);
      let root = this.createDivWithClass('carousel');
      let container = this.createDivWithClass('carousel__container');
      root.appendChild(container);
      this.element.appendChild(root);
      this.children.forEach( (child) => {
        container.appendChild(child);
      })
    }
    /**
     * 
     * @param {string} className
     * @returns {HTMLElement} 
     */
    createDivWithClass (className){
      let div = document.createElement('div');
      div.setAttribute('class', className)
      return div;
    }
  }

  const carouselHolder = document.querySelector('.carousel__panorama');
  if (carouselHolder){
    console.log(carouselHolder);
    new Carousel(carouselHolder, {
      visibleSlides: 2,
      slidesToScroll: 2
    })
  }




