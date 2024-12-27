<section class="hero">
    <div class="container">
      <!-- Breadcrumbs -->
      <ol class="breadcrumb justify-content-center">
        <li class="breadcrumb-item"><a href="<?=$router->generate('home')?>">Home</a></li>
        <li class="breadcrumb-item active"><?=$viewData['category']->getName()?></li>
      </ol>
      <!-- Hero Content-->
      <div class="hero-content pb-5 text-center">
        <h1 class="hero-heading"><?=$viewData['category']->getName()?></h1>
        <div class="row">
          <div class="col-xl-8 offset-xl-2">
            <p class="lead text-muted"><?=$viewData['category']->getSubtitle()?></p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="products-grid">
    <div class="container-fluid">

      <div class="row">

        <!-- product-->
        <?php foreach($viewData['products'] as $product) : ?>
        <div class="product col-xl-3 col-lg-4 col-sm-6">
          <div class="product-image">
            <a href="<?=$router->generate('catalog-product', ['id' => $product->getId()])?>" class="product-hover-overlay-link">
              <img src="<?=$baseRoute.'/'.$product->getPicture()?>" alt="product" class="img-fluid">
            </a>
          </div>
          <div class="product-action-buttons">
            <a href="#" class="btn btn-outline-dark btn-product-left"><i class="fa fa-shopping-cart"></i></a>
            <a href="<?=$router->generate('catalog-product', ['id' => $product->getId()])?>" class="btn btn-dark btn-buy"><i class="fa-search fa"></i><span class="btn-buy-label ml-2">Voir</span></a>
          </div>
          <div class="py-2">
            <p class="text-muted text-sm mb-1">
            <!-- Pour remplacer le type du produit -->
            <?=$typeListById[$product->getType_id()]->getName()?>
            </p>
            <h3 class="h6 text-uppercase mb-1"><a href="<?=$router->generate('catalog-product', ['id' => $product->getId()])?>" class="text-dark"><?=$product->getName()?></a></h3>
            <span class="text-muted"><?=$product->getPrice()?>€</span>
          </div>
        </div>
        <?php endforeach ?>
        <!-- /product-->
        
      </div>
      
    </div>
  </section>