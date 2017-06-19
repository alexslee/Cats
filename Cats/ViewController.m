//
//  ViewController.m
//  Cats
//
//  Created by Alex Lee on 2017-06-19.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) NSMutableArray<FlickrImage *> *photos;

@property (nonatomic)CGPoint point;

@property (strong, nonatomic) FlickrManager *flickrManager;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.flickrManager = [[FlickrManager alloc] init];
    [self.flickrManager collectImagesWithCompletionHandler:^(NSMutableArray *constructedPhotos) {
        self.photos = constructedPhotos;
        for (FlickrImage *photo in self.photos) {
            NSLog(@"this photo has a URL of: %@",photo.constructedURL);
        }
        [self.collectionView reloadData];
    }];
    
//    for (FlickrImage *photo in self.photos) {
//        NSLog(@"this photo has a URL of: %@",photo.constructedURL);
//    }
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.photos count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    FlickrImage *photoData = [self.photos objectAtIndex:indexPath.row];
    if (photoData.image == nil) {
        [self.flickrManager downloadImageWithCompletionHandler:^(UIImage *image) {
            photoData.image = image;
            cell.imageView.image = image;
            cell.imageName.text = photoData.imageName;
            
        } fromURL:photoData.constructedURL];
    }
    else {
        cell.imageView.image = photoData.image;
        cell.imageName.text = photoData.imageName;
    }
    return cell;
}
- (IBAction)tapToDetailedView:(UITapGestureRecognizer *)sender {
    self.point = [sender locationInView:self.collectionView];
    [self performSegueWithIdentifier:@"showImageDetail" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showImageDetail"]) {
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:self.point];
        ImageDetailViewController *controller = (ImageDetailViewController *)[segue destinationViewController];
        
        FlickrImage *image = [self.photos objectAtIndex:indexPath.row];
        
        if (image.imageDetails == nil) {
            [self.flickrManager downloadDetailsForImage:image withCompletion:^(FlickrImageDetails *details) {
                image.imageDetails = details;
                [controller setupForImage:image];
            }];
        } else {
            [controller setupForImage:image];
        }
    }
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.flickrManager.downloadTask suspend];
}

@end
