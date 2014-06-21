library atomic.spec;

import 'package:atomic/atomic.dart';
import 'package:hub/hub.dart';
import 'dart:async';

class M{
	String name,day;
	M(this.name,this.day);
}

void main(){

	var m = new M('job','monday');

	var z  = Atomic.create({
		'name':'john',
		'day':'sunday',
		'map':{
			'day':'bomb',
			'f':{'bro':'job'}
		},
		'list': [1,323,43]
	});

	var d = Atomic.create(m);

	z.watchKey('name');
	z.watchKey('day');
	z.watchKey('map');
	z.watchKey('list');
	z.watchField('length');
	d.watchField('name');

	z.bind('length',Funcs.tag('length-binding'));
	z.bind('name',Funcs.tag('name-binding'));
	z.bind('map',Funcs.tag('map-binding'));
	z.bind('list',Funcs.tag('list-binding'));
	d.bind('name',Funcs.tag('inst-name-binding'));
	z.bindExpected('day','monday',Funcs.tag('day-expected-binding'));


	z.discharge(7000); 
	d.discharge(7000); 

	z.energize(2000);
	d.energize(2000);
	z.obj['day'] = "monday";
	z.obj['name'] = "alex";
	z.obj['run'] = false;
	m.name = 'blob';

	new Timer(new Duration(milliseconds:3000),(){ 
		z.obj['name'] = "fred";
		m.name = 'johs';
		z.obj['run'] = true;
		z.obj['list'].add('bro');
		z.obj['list'][1] = ('2bro');
		z.obj['map']['day']='firdaybombing';
		z.obj['map']['f']['bro']='sop';
	});

}