import 'package:minio/io.dart';
import 'package:minio/minio.dart';

void main() async {
  final minio = Minio(
    endPoint: '192.168.31.38',
    port: 9000,
    accessKey: 'minioadmin',
    secretKey: 'minioadmin',
    useSSL: false,
    // enableTrace: true,
  );

  final bucket = 'message-attachment';
  final object = '6251343144791240704.png';

  if (!await minio.bucketExists(bucket)) {
    await minio.makeBucket(bucket);
    print('bucket $bucket created');
  } else {
    print('bucket $bucket already exists');
  }

  await minio.fGetObject(bucket, object, 'example/$object');

  // final poller = minio.listenBucketNotification(bucket, events: [
  //   's3:ObjectCreated:*',
  // ]);
  // poller.stream.listen((event) {
  //   print('--- event: ${event['eventName']}');
  // });
  //
  // final region = await minio.getBucketRegion('00test');
  // print('--- object region:');
  // print(region);
  //
  // final etag = await minio.fPutObject(bucket, object, 'example/$object');
  // print('--- etag:');
  // print(etag);
  //
  // final url = await minio.presignedGetObject(bucket, object, expires: 1000);
  // print('--- presigned url:');
  // print(url);
  //
  //
  //
  // await minio.listObjects(bucket).forEach((chunk) {
  //   print('--- objects:');
  //   chunk.objects.forEach((o) => print(o.key));
  // });
  //
  // await minio.listObjectsV2(bucket).forEach((chunk) {
  //   print('--- objects(v2):');
  //   chunk.objects.forEach((o) => print(o.key));
  // });
  //
  // final stat = await minio.statObject(bucket, object);
  // print('--- object stat:');
  // print(stat.etag);
  // print(stat.size);
  // print(stat.lastModified);
  // print(stat.metaData);
  //
  //
  // await minio.removeBucket(bucket);
  // print('--- bucket removed');
  //
  // poller.stop();
}
