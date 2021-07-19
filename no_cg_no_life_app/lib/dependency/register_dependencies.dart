

import 'package:get/get.dart';
import 'package:no_cg_no_life_app/models/dao_models/CourseDAO.dart';
import 'package:no_cg_no_life_app/models/dao_models/DAO.dart';
import 'package:no_cg_no_life_app/models/domain_models/Course.dart';
import 'package:no_cg_no_life_app/repository/base_repository.dart';
import 'package:no_cg_no_life_app/repository/base_repository_impl.dart';
import 'package:no_cg_no_life_app/repository/database_repository.dart';
import 'package:no_cg_no_life_app/repository/sqlite_database_repository_impl.dart';

void registerDependencies(){
  Get.put<DatabaseRepository>( SqliteDatabaseRepositoryImpl(), permanent: true );
  Get.lazyPut< DAO<Course> >( ()=> CourseDAO() );
  Get.lazyPut< BaseRepository<Course> >( ()=> BaseRepositoryImpl<Course>( Get.find(), Get.find() ) );
}