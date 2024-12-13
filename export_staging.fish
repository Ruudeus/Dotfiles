function export_staging
set -gx MONGO_URL 'mongodb://wolkus_fasal_staging_user:XvwUrUGzXi55hlTw@fasal-staging-shard-00-00.r7olm.mongodb.net:27017,fasal-staging-shard-00-01.r7olm.mongodb.net:27017,fasal-staging-shard-00-02.r7olm.mongodb.net:27017/fasal?ssl=true&replicaSet=atlas-e7bhit-shard-0&authSource=admin&retryWrites=true&w=majority';
end
